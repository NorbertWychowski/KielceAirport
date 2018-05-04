# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi, in interdum massa nibh nec erat.
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."

pic1 = File.new('app/assets/images/0e4fb6e75a40f3ac328f8fe2e841898e.jpg')
pic2 = File.new('app/assets/images/c8e7e9a120f19bc434a4fce5fcf83e4d.jpg')
pic3 = File.new('app/assets/images/harold-0.jpg')
pic4 = File.new('app/assets/images/hYE8QQO.jpg')


News.create([{title: "News nr 1", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 2", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 3", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 4", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 5", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 6", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 7", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 8", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 9", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 10", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 11", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 12", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 13", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 14", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 15", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 16", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 17", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 18", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 19", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 20", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 21", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 22", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 23", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 24", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 25", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 26", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 27", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 28", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 29", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 30", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 31", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 32", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 33", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 34", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 35", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 36", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 37", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 38", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 39", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 40", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 41", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 42", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 43", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 44", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 45", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 46", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 47", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 48", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 49", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 50", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 51", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 52", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 53", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 54", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 55", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 56", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 57", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 58", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 59", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 60", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 61", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 62", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 63", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 64", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 65", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 66", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 67", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 68", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 69", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 70", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 71", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 72", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 73", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 74", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 75", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 76", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 77", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 78", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 79", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 80", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 81", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 82", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 83", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 84", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 85", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 86", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 87", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 88", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 89", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 90", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 91", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 92", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 93", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 94", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 95", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 96", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 97", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 98", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 99", content: lorem_ipsum, add_date: Time.now, image: pic4},
             {title: "News nr 100", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 101", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 102", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 103", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 104", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 105", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 106", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 107", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 108", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 109", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 110", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 111", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 112", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 113", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 114", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 115", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 116", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 117", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 118", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 119", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 120", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 121", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 122", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 123", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 124", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 125", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 126", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 127", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 128", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 129", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 130", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 131", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 132", content: lorem_ipsum, add_date: Time.now, image: pic2},
             {title: "News nr 133", content: lorem_ipsum, add_date: Time.now, image: pic3},
             {title: "News nr 134", content: lorem_ipsum, add_date: Time.now, image: pic1},
             {title: "News nr 135", content: lorem_ipsum, add_date: Time.now, image: pic3}])