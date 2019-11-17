# Given a DNA strand, return its RNA complement (per RNA transcription)
class Complement
  class << self
    def of_dna(strand)
      /[^GCTA]/ =~ strand ? '' : strand.tr('GCTA', 'CGAU')
    end
  end
end
