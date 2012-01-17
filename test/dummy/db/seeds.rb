SettrSetting.create!({
  :key        => 'collection1.group1.price',
  :value      => '1.0',
  :typ        => 'float',
  :alterable  => 'true'
})

SettrSetting.create!({
  :key        => 'collection1.bool',
  :value      => 'true',
  :typ        => 'boolean',
  :alterable  => 'true'
})

SettrSetting.create!({
  :key        => 'collection1.group1.number',
  :value      => '1',
  :typ        => 'integer',
  :alterable  => 'true'
})

SettrSetting.create!({
  :key        => 'collection1.group2.string',
  :value      => 'lorem ipsum',
  :typ        => 'string',
  :alterable  => 'true'
})

SettrSetting.create!({
  :key        => 'collection2.group3.select',
  :value      => 'first_option',
  :typ        => 'select',
  :options    => 'first_option, second_option, third_option',
  :alterable  => 'true'
})