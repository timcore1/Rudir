require 'net/http'
require 'uri'

class BruteForcer
  def initialize(url, wordlist)
    @url = url
    @wordlist = wordlist
  end

  def run
    uri = URI.parse(@url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'

    File.foreach(@wordlist) do |line|
      path = line.strip
      full_url = URI.join(@url, path).to_s
      request = Net::HTTP::Get.new(full_url)

      response = http.request(request)

      if response.code.to_i == 200
        puts "[+] Found: #{full_url}"
      else
        puts "[-] Not Found: #{full_url}"
      end
    end
  end
end

if ARGV.length != 2
  puts "Usage: ruby brute_forcer.rb <URL> <wordlist>"
  exit(1)
end

url = ARGV[0]
wordlist = ARGV[1]

brute_forcer = BruteForcer.new(url, wordlist)
brute_forcer.run
