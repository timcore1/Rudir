require 'net/http'
require 'uri'

class BruteForcer
  def initialize(url, wordlist)
    @url = url
    @wordlist = wordlist
  end

  def run
    File.foreach(@wordlist) do |line|
      path = line.strip
      full_url = URI.join(@url, path).to_s
      response = Net::HTTP.get_response(URI(full_url))

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
