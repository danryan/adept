class String
  def to_dpkg_field
    self.tr('_', '-').split('-').map(&:capitalize).join('-')
  end

  def to_dpkg_field!
    str = self.dup
    self.replace(str.to_dpkg_field)
  end
end
