yum install xorg-x11-server-Xvfb bzip gtk3
cd /usr/local
wget https://ftp.mozilla.org/pub/firefox/releases/56.0.2/linux-x86_64/en-US/firefox-56.0.2.tar.bz2
tar xjvf firefox-56.0.2.tar.bz2
rm -f /usr/bin/firefox
ln -s /usr/local/firefox/firefox /usr/bin/firefox
wget   https://files.pythonhosted.org/packages/14/d6/650f5d2e149b83cd24989653efedf47a24cafb72e9d2dd03191a9f52f2f4/selenium-3.8.1-py2.py3-none-any.whl
pip uninstall selenium
pip install selenium-3.8.1-py2.py3-none-any.whl
yum install gtk3
yum install gtk2
cd /usr/local/bin
wget https://github.com/mozilla/geckodriver/releases/download/v0.19.1/geckodriver-v0.19.1-linux64.tar.gz
tar xvzf geckodriver-*.tar.gz
rm -f /usr/bin/geckodriver
ln -s /usr/local/geckodriver /usr/bin/geckodriver
