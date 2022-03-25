# Your Jruby script code goes here

require 'time'
import 'org.apache.hadoop.hbase.client.HTable'
import 'org.apache.hadoop.hbase.client.Put'
import 'javax.xml.stream.XMLStreamConstants'

def jbytes(*args)
  args.map { |arg| arg.to_s.to_java_bytes }
end

factory = javax.xml.stream.XMLInputFactory.newInstance
reader = factory.createXMLStreamReader(java.lang.System.in)
document = nil
buffer = nil
count = 0
table = HTable.new(@hbase.configuration, 'foods')
table.setAutoFlush(false)

while reader.has_next
  type = reader.next

  if type == XMLStreamConstants::START_ELEMENT
    if reader.local_name == 'Food_Display_Row'
      document = {}
    else
      buffer = []
    end
  elsif type == XMLStreamConstants::CHARACTERS
    buffer << reader.text unless buffer.nil?
  elsif type == XMLStreamConstants::END_ELEMENT
    if reader.local_name != 'Food_Display_Row'
      document[reader.local_name] = buffer.join
    else
      key = document['Display_Name'].to_java_bytes
      p = Put.new(key)
      document.each { |k, v| p.add(*jbytes('fact', k, v)) }
      table.put(p)
      count += 1
      table.flushCommits if (count % 10).zero?
      puts "#{count} records inserted (#{document['Display_Name']})" if (count % 10).zero?
    end
  end
end

table.flushCommits
# Do not remove the exit call below
exit