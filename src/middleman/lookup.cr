class Lookup
  ALPHABET = ('a'..'z').to_a + ('0'..'9').to_a

  def self.generate(lookup : String = "")
		return lookup + ALPHABET.sample
  end
end
