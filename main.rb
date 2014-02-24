require "ostruct"
require 'yaml'

CODE_ROOT = File.expand_path(File.dirname(__FILE__)) unless defined? CODE_ROOT
Dir.glob(CODE_ROOT + "/data/*.rb").each do |libname|
  warn "loading ==> #{libname}"
  require libname
end

# factor verification

[damages, perils].each do |dp|
  dp.each do |k, v|
    v.split(',').map(&:strip).each do |fn|
      raise "Factor not found: '#{fn} (#{k})'" if factors[fn].nil?
    end
  end
end

# group relationship verification

damage_groups.each do |n, o|
  o['damages'].each do |dn|
    raise "damage not found: '#{dn} (#{n})'" if damages[dn].nil?
  end
end

peril_groups.each do |n, o|
  o['perils'].each do |pn|
    raise "peril not found: '#{pn} (#{n})'" if perils[pn].nil?
  end
end

coverages.each do |cov|
  cov["perils"].split(';').map(&:strip).each do |pn|
    raise "Peril not found: '#{pn}'"if perils[pn].nil?
  end

  cov["damages"].split(';').map(&:strip).each do |dn|
    raise "Damage not found: '#{dn}'"if damages[dn].nil?
  end
end

# generation methods

def generate_entities(entities, prefix)
  count = 0
  [].tap do |results|
    entities.each do |n, fs|
      entity = {
        'name' => n,
        'code' => "#{prefix}%03d" % count,
        'description' => nil,
        'risk_category' => 'AUTO',
        'factors' => fs.split(',').map(&:strip).map do |fn|
            {
              'name' => fn,
              'context' => factors[fn]
            }
          end
      }
      count += 1
      results << entity
    end
  end
end

#puts generate_entities(damages, "DAM").to_yaml
#puts generate_entities(perils, "PEA").to_yaml

def generate_groups(groups, type)
  [].tap do |results|
    groups.each do |n, obj|
      group = {}
      group["name"] = obj['name']
      group["code"] = n
      group["risk_category"] = "AUTO"
      group[type] = obj[type]
      results << group
    end
  end
end

# generate_groups(damage_groups, 'damages')
# generate_groups(peril_groups, 'perils')

def generate_coverages
  [].tap do |results|
    count = 0
    coverages.each do |obj|
      cov = {
        'name' => obj['name'],
        'code' => "COV%03d" % count,
        'main_coverage' => !obj['rider'],
        'risk_category' => "AUTO",
        'insured_object' => "VEHICLE",
        'coverage_group' => obj['name'].gsub(/^.*\((.+)\).*$/, "\\1"),
        'limits' => [],
        'deductible' => [],
        'premium' => {
          'type' => 'FixedValue',
          'value' => 0.0
        }
      }
      cov['description'] = obj['damages'].split(';').join(',') +
        " caused by " + obj['perils'].split(';').join(',') + '.'
      
      if obj['name'] =~ /^([A-Z]+) \(([A-Z]+)\).*$/
        pg, dg = $1, $2
        cov['peril_groups'] = [
          {
            'code' => pg,
            'perils' => obj['perils'].split(';').map(&:strip),
            'damage_groups' => [
              {
                'code' => dg,
                'damages' => obj['damages'].split(';').map(&:strip)
              }
            ]
          }
        ]
      end

      results << cov
      count += 1
    end
  end
end

puts generate_coverages.to_yaml
