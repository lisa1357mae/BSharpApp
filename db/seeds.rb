User.create([
  {id:1, first: 'Lisa', last: 'Mae', email: 'lisamae', password: 'test'},
  {id:2, first: 'Tom', last: 'Petty', email: 'tpetty', password: 'test'},
  {id:3, first: 'Michael', last: 'Jackson', email: 'mj', password: 'test'}
  ])
Event.create([
  {id:1, user_id: 1, photo: File.new("public/pictures/guitar.jpg"), name: "Fun Guitar Jamboree"},
  {id:2, user_id: 1, photo: File.new("public/pictures/Facebook.png"), name: "Social network fun"}
  ])
