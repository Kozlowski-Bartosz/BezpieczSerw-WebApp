resource "aws_key_pair" "primary_key" {
  key_name = "id_ed25519"

  public_key = file("~/.ssh/id_ed25519.pub")
}