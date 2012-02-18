require 'date'

# █████████████████████████
# █ ███ █     █  ████  ████
# █ ███ ███ ███  ████  ████
# █ █ █ ███ ███  ████  ████
# █ █ █ ███ ███  ████  ████
# █     █     █     █     █
# █████████████████████████

PATTERN = <<-EOF.split("\n").map{|line| line.split(//)}.transpose.map(&:join).join
XXXXXXXXXXXXXXXXXXXXXXXXX
X XXX X     X  XXXX  XXXX
X XXX XXX XXX  XXXX  XXXX
X X X XXX XXX  XXXX  XXXX
X X X XXX XXX  XXXX  XXXX
X     X     X     X     X
XXXXXXXXXXXXXXXXXXXXXXXXX
EOF

MASK = PATTERN.split(//).map{|c| c == 'X'}

DAYSTART = Date.new(2012,2,19)
DAYEND   = DAYSTART + (PATTERN.size*4) # 2014-01-19


# def test_pattern
#   (0..6).map{|n| (PATTERN.split(//)*3).each_with_index{|c,i| print c if i%7==n}; print "\n"}
# end

dates = DAYSTART.upto( DAYEND ).to_a

def on?(date)
  delta = (date - DAYSTART).to_i
  MASK[ delta % MASK.size ]
end

commit_dates = []
dates.each do |date|
  if on?(date)
    12.times{|i| commit_dates << date.to_time + i*7200}
  end
end

puts commit_dates.first
#commit_dates.each do |date|
#  `GIT_AUTHOR_DATE="#{date}" GIT_COMMITTER_DATE="#{date}" git commit -m "#{date}" --allow-empty`
#end

