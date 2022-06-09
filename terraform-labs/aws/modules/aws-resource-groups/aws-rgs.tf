resource "aws_resourcegroups_group" "pub_servers" {
  name = "pub_servers_rg"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
  ],
  "TagFilters": [
    {
      "Key": "Environment",
      "Values": ["devenv"]
    }
  ]
}
JSON
  }
}



resource "aws_resourcegroups_group" "priv_servers" {
  name = "priv_servers_rg"

  resource_query {
    query = <<JSON
{
  "ResourceTypeFilters": [
    "AWS::EC2::Instance"
  ],
  "TagFilters": [
    {
      "Key": "Environment",
      "Values": ["devenv","pocenv","stageenv"]
    }
  ]
}
JSON
  }
}
