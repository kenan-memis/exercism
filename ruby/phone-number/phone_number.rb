class PhoneNumber
  def self.clean(phone_number)
    modified = phone_number.gsub(/\D/, '')

    modified = modified[1..-1] if modified.start_with?('1')

    return nil if [modified[0], modified[3]].any? { |c| %w[0 1].include?(c) }

    return nil unless modified.length == 10

    modified
  end
end
