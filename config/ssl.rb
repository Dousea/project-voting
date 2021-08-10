# frozen_string_literal: true

def custom_ssl_bind
  certs_dir = File.join(Dir.pwd, 'config', 'certificates')
  end_entity_key_path = File.join(certs_dir, 'end_entity_key.pem')
  end_entity_cert_path = File.join(certs_dir, 'end_entity_cert.pem')

  ssl_bind '0.0.0.0', 3001, key: end_entity_key_path, cert: end_entity_cert_path
end
