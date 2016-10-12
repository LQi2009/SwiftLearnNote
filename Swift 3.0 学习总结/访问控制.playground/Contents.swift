//: Playground - noun: a place where people can play

/*
 private  文件内可访问
 internal 模块内访问
 public   模块间访问
 */


let app = App(name: "My first app")
app.show()



// ****** 单例 ******
let gameManager = GameManager.defauleGameManager
gameManager.addScore()
gameManager.score


let gm = GameManager.defauleGameManager
gm.addScore()
gm.score

        