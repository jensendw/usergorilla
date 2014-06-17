module SessionsHelper
  def IsAdmin(membersin)
    begin
      groupdn=membersin.join(" ")
      groupdn.include? 'hosting'
    rescue
      false
    end
  end
end
