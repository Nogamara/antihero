IB_BASE_URL = 'http://marvelheroes.info'.freeze

ITEM_STATUSES = [
  ['Missing', 'missing'],
  ['Equipped', 'equipped']
].freeze

ITEM_STATUSES_KEYS = ITEM_STATUSES.map{|x| x[1]}

ITEM_TYPES = [
  ['Unique', 'unique'],
  ['Uru-Forged', 'uru-forged'],
  ['Ring', 'ring'],
  ['Legendary', 'legendary'],
  ['Artifact', 'artifact'],
  ['Insignia', 'insignia'],
  ['Medallion', 'medallion'],
  ['Relic', 'relic'],
  ['Core', 'core'],
  ['Misc', 'misc']
].freeze

ITEM_TYPES_KEYS = ITEM_TYPES.map{|x| x[1]}

HERO_STARS = ["☆", "★", "✪"].freeze
