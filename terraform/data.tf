data "aws_ami" "ue4_dedicated_ami" {
    owners = ["self"]
    most_recent = true
    filter {
        name    = "name"
         values = ["ue4-server-host*"]
    }
}
