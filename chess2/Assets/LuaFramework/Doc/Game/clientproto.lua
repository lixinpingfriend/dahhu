local proto = {
	cmd = {
		loginReq = "Login.LoginReq",
        enter = "Room.EnterReq",
        ready = "Room.ReadyReq",
        start = "Room.StartReq",
        compute = "Game.ComputePokerReq"
	},
	body = {
        loginReq = {account = 12345},
        def = {},
        enter={
            room_id = 1
        },
        ready={
            isReady = 1
        },
        start={

        },
        compute={

        }
	}
}

return proto
