# Your code goes here

import 'org.apache.hadoop.hbase.client.HTable'
import 'org.apache.hadoop.hbase.client.Put'

def jbytes(*args)
  args.map { |arg| arg.to_s.to_java_bytes }
end

def put_many(table_name, row, column_values)
  table = HTable.new(@hbase.configuration, table_name)
  p = Put.new(*jbytes(row))

  column_values.each do |k, v|
    arr = k.split(':')
    p.add(*jbytes(arr.first, arr.length > 1 ? arr.last : '', v))
  end

  table.put(p)
end

put_many  'wiki', 'NoSQL', {
  "text:" => "React is awesome!",
  "revision:author" => "Mila Hose",
  "revision:comment" => "Angular is also cool" }

get 'wiki', 'NoSQL'

# Do not remove the exit call below
exit
