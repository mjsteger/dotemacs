#!/usr/bin/env ruby

$ruby_doc_local = "~/dotemacs/utils/ruby_1_9_2_core"
$ruby_documents_online = "http://www.ruby-doc.org/core-1.9.2/"
optionalArg = ARGV[1]
case ARGV.first
when "Filename"
  dataDump = `grep -R #{optionalArg} #{$ruby_doc_local} | grep '<li>' | grep '#method-i' | head -1`
  className = dataDump.split(":").first.split("\/")[-1]
  puts $ruby_documents_online + className + dataDump.split("\"")[1]

end
