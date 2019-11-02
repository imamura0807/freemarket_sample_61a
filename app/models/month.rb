class Month < ActiveHash::Base
  self.data = [
    {id: 1, numeral: '1'}, {id: 2, numeral: '2'}, {id: 3, numeral: '3'},
    {id: 4, numeral: '4'}, {id: 5, numeral: '5'}, {id: 6, numeral: '6'},
    {id: 7, numeral: '7'}, {id: 8, numeral: '8'}, {id: 9, numeral: '9'},
    {id: 10, numeral: '10'}, {id: 11, numeral: '11'}, {id: 12, numeral: '12'},
  ]
end