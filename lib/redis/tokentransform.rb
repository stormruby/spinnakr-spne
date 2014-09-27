require_relative './redistoken'

class Transform
  def transform_customer_token(data)
    hm = Hash.new
    rt = RedisToken.new
    data.each do |key,value|
      if key == 'token_id'
        apkey = rt.get_apkey_from_uuid(value)
        account = rt.get_account_from_apkey(apkey)
        project = rt.get_project_from_apkey(apkey)
        dbnumber = rt.getDbNumber_from_accountid(account)
        print key, ' ', value, ' ', apkey, ' ', account, ' ', project, ' ', dbnumber; puts
        hm['account'] = account
        hm['project'] = project
        hm['dbnumber'] = dbnumber
      else
        hm[key] = value
       end
    end
    hm
  end
end
