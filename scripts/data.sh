#!/bin/bash
apt update -y
apt install -y apache2 awscli
systemctl start apache2
systemctl enable apache2

mkdir -p /var/www/html/assets
aws s3 cp s3://ta-static-site-assests/ /var/www/html/assets/ --recursive

cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My AWS Static Site</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
    <h1>Welcome to My AWS Static Website</h1>
    <p>Hosted on EC2 | Assets from S3 | Secured via IAM</p>
  </header>
  <section>
    <h2>About This Project</h2>
    <p>This site is deployed using a custom VPC, EC2 instance, S3 for asset storage, and IAM roles for secure access — no hardcoded credentials.</p>
  </section>
  <footer>
    <p>Built by Taufiq Ahamed.T.J | AWS Cloud Project</p>
  </footer>
</body>
</html>
EOF

cat > /var/www/html/style.css << 'EOF'
body { font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f4f4f4; color: #333; }
header { background-color: #232f3e; color: white; padding: 30px; text-align: center; }
section { padding: 20px 40px; max-width: 700px; margin: 0 auto; }
footer { text-align: center; padding: 15px; background-color: #232f3e; color: white; margin-top: 30px; }
EOF

chown -R www-data:www-data /var/www/html
