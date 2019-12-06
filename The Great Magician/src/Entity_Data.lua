Entity_Data = {
  ['player'] = {
    walkspeed = Player_Walk_Speed,
    jumpspeed = Player_Jump_Speed,
    animations = {
      ['idle'] = {
        frames = {1},
        interval = 1

      },
      ['moving'] = {
        frames = {3,2,1},
        interval = 0.4
      },
      ['attack'] = {
        frames = {4},
        interval = 1
      }



    }
  },
    ['skeleton'] = {
      walkspeed = Player_Walk_Speed,
      direction = 'left',
      animations = {
        ['moving'] = {
          frames = {1,2,3,4,5,6,7,8},
          interval = 0.2

        }


    }


  },
  ['wizard'] = {
    walkspeed = Player_Walk_Speed,
    direction = 'left',
    animations = {
      ['moving'] = {
        frames = {1,2,3},
        interval = 0.3

      },
      ['idle'] = {
        frames = {1,2,3,4},
        interval = 0.2
      },
      ['death'] = {
        frames = {1,2,3,4,5,6,7,8,9},
        interval = 0.15
      }


  }


},

  ['flower'] = {
    animations = {
      ['idle'] = {
        frames = {1},
        interval = 1

      },
      ['attack'] = {
        frames = {1,2,3,4,5,6},
        interval = 0.2
      }

    }
  }

}
