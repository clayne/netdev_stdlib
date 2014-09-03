# encoding: utf-8

Puppet::Type.newtype(:snmp_user) do
  @doc = 'Set the SNMP contact name'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the SNMP user'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:roles, array_matching: :all) do
    desc 'A list of roles associated with this SNMP user'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:auth) do
    desc 'Authentication mode [md5|sha]'
    newvalues(:md5, :sha)
  end

  newproperty(:password) do
    desc 'Cleartext password for the user'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newproperty(:privacy) do
    desc 'Privacy encryption method [aes128|des]'
    newvalues(:aes128, :des)
  end

  newproperty(:private_key) do
    desc 'Private key in hexadecimal string'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end

  newparam(:localized_key) do
    desc 'If true, password needs to be a hexadecimal value'
    newvalues(:true, :false)
  end

  newparam(:enforce_privacy) do
    desc 'If true, message encryption is enforced'
    newvalues(:true, :false)
  end

  newproperty(:engine_id) do
    desc 'Necessary if the SNMP engine is encrypting data'

    validate do |value|
      if value.is_a? String then super(value)
      else fail "value #{value.inspect} is invalid, must be a String."
      end
    end
  end
end