def damage_groups
  {
    'OD' => {
      'name' => 'OWN AUTO DAMAGE',
      'damages' => ["Physical Damage - Repairing Cost", "Vehicle Replacement or Transportation Cost", 
        "Reinstating Cost", "Removing Fee", "Fixtures / Accessories", "Scratch", 
        "Tire Damage", "Window Breakage", "COE and PARF Replacement Cost", 
        "Cargo Damage", "Wear & Tear", "Depreciation", "Mechanical or Electrical Malfuncton", "Engine Damage"]
    },
    'ME' => {
      'name' => 'MISCELLANEOUS EXPENSE',
      'damages' => ["Replacement Cost of Key", "Replacement Cost of Document", "Personal Belongings Damage"]
    },
    'PA' => {
      'name' => 'OWN BODY INJURY',
      'damages' => ["Driver's Bodily Injury or Death", "Driver's Medical Expense"]
    },
    'PBI' => {
      'name' => 'PASSENGER BODY INJURY',
      'damages' => ["Passenger's Bodily Injury or Death", "Passenger's Medical Expense", "Moral Damage", "Legal Service Expense"]
    },
    'TP' => {
      'name' => 'THIRD PARTY PROPERTY DAMAGE & BODY INJURY',
      'damages' => ["Third Party's Property Damage", "Third Party's Bodily Injury or Death", "Third Party's Medical Expense", "Moral Damage", "Legal Service Expense"]
    }
  }
end
