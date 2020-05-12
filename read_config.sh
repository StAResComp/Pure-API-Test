config_file=~/.pureApiTestConfig

# Read the data directory from config file
data_dir="$(grep '^data_dir' $config_file | cut -d'=' -f2)"

# Avoid tilde expansion issues later on
data_dir="$(eval echo ${data_dir})"

# DB details
db_file="pureApiTest.sqlite"
db_path="$data_dir/$db_file"

# Read the Pure URL from config file
pure_url="$(grep '^pure_url' $config_file | cut -d'=' -f2)"

# Read the API Key from config file
api_key="$(grep '^api_key' $config_file | cut -d'=' -f2)"

# Responses dir details
responses_dir="responses"
responses_path="$data_dir/$responses_dir"
