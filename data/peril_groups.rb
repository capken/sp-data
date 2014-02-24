def peril_groups
  {
    'COF' => {
      'name' => 'COLLISION, UPSET & FALL',
      'perils' => ["Collision", "Overturning", "Falling off Bridge or Cliff"]
    },
    'FSE' => {
      'name' => 'FIRE, SELF IGNITION & EXPLOSION',
      'perils' => ["Fire", "Self Ignition", "External Explosion"]
    },
    'TH' => {
      'name' => 'THEFT',
      'perils' => ["Theft", "Robbery", "Burglary", "Housebreaking"]
    },
    'NATURE' => {
      'name' => 'ACTS OF NATURE',
      'perils' => ["Lightning", "Hurricane", "Hail", "Earthquake", 
        "Flood", "Typhoon", "Tornado", "Cyclone", "Volcanic Eruption", "Tremor"]
    },
    'FO' => {
      'name' => 'FALLING OBJECTS',
      'perils' => ["Falling Objects"]
    },
    'MAN' => {
      'name' => 'ACTS OF MAN',
      'perils' => ["War Related Act", "Strike, Riot or Civil Commotion", "Act of Terrorism", 
        "Act by Authority of Law or Fact, Civil or Military", 
        "Detention, Seizure, Confiscation or Any Attempt Threat", 
        "Radiation", "Nuclear Related Impact", "Deliberate Act", 
        "Omission / Negligence", "Malicious Act", "Overloading or Strain"]
    }
  }
end
