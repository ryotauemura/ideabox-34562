class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '経済' },
    { id: 3, name: '政治' },
    { id: 4, name: '地域' },
    { id: 5, name: '国際' },
    { id: 6, name: 'IT' },
    { id: 7, name: 'エンタメ' },
    { id: 8, name: 'スポーツ' },
    { id: 9, name: 'グルメ' },
    { id: 10, name: '家庭' },
    { id: 11, name: '仕事' },
    { id: 12, name: '学業' },
    { id: 13, name: 'その他' }
  ]

   include ActiveHash::Associations
   has_many :articles 

  end