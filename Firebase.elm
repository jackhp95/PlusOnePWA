import Json.Encode
import Json.Decode exposing ((:=))
-- elm-package install --yes circuithub/elm-json-extra
import Json.Decode.Extra exposing ((|:))

type alias FireBase =
    { chatMessages : FireBaseChatMessages
    , chats : FireBaseChats
    , events : FireBaseEvents
    , pools : FireBasePools
    , presence : FireBasePresence
    , users : FireBaseUsers
    }

type alias FireBaseChatMessages UID =
    { isMilestoneMessage : Bool
    , message : String
    , name : String
    , timestamp : Int
    , userId : String
    }


type alias FireBaseChatMessages UID =
    { UID : FireBaseChatMessages UID
    , UID : FireBaseChatMessages UID
    }

type alias FireBaseChats String =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChats String =
    { chatUri : String
    , chatWithUser : UID
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChats UID =
    { -KxLMk7zLGqxdIOzsiG6 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI =
    { chatUri : String
    , chatWithUser : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser
    , eventId : String
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { -KybEva90QTw_a_VEsZI : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN =
    { chatUri : String
    , chatWithUser : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { -KxO93poardaJ2a-CqGN : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN
    }

type alias FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 =
    { chatUri : String
    , chatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { -KxLMk7zLGqxdIOzsiG6 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm =
    { chatUri : String
    , chatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL =
    { chatUri : String
    , chatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { -KxkR5mShBbsnMh7QcTm : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm
    , -KzVgsXCuBLOAxbtH9tL : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL
    }

type alias FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI =
    { chatUri : String
    , chatWithUser : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser
    , eventId : String
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { -KybEva90QTw_a_VEsZI : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV =
    { chatUri : String
    , chatWithUser : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { -KybEGRljXC4R5uj5WfV : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV
    }

type alias FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm =
    { chatUri : String
    , chatWithUser : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL =
    { chatUri : String
    , chatWithUser : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { -KxkR5mShBbsnMh7QcTm : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm
    , -KzVgsXCuBLOAxbtH9tL : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL
    }

type alias FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN =
    { chatUri : String
    , chatWithUser : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { -KxO93poardaJ2a-CqGN : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser =
    { firstName : String
    , imageUrl : String
    , userId : String
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV =
    { chatUri : String
    , chatWithUser : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser
    , eventId : Int
    , eventTitle : String
    , hasUnreadMessages : Bool
    , id : String
    , lastMessage : String
    , lastMessageSenderId : String
    , timestamp : Int
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { -KybEGRljXC4R5uj5WfV : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV
    }

type alias FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
    }

type alias FireBaseChats =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-KxuNWKdE2OOVkCaM6cg =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents-KxzZi9Fes13OXqZTGj9Location =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-KxzZi9Fes13OXqZTGj9 =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-KxzZi9Fes13OXqZTGj9Location
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents-KxzZtArllZqYjA5zAiWLocation =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-KxzZtArllZqYjA5zAiW =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , imageSrc : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-KxzZtArllZqYjA5zAiWLocation
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-Kyb8nduQgewzJ9_wn2I =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-Kyb96-8BR0G8Ik-b-LA =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , imageSrc : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation =
    { city : String
    , state : String
    , venue : String
    }

type alias FireBaseEvents-KzUkjyJ0Wks4IyVxrMs =
    { date : String
    , description : String
    , eventCreatorUserId : String
    , eventSource : Int
    , id : String
    , imageSrc : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation
    , privateLookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation =
    { addressLine1 : String
    , city : String
    , state : String
    , venue : String
    }

type alias FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d =
    { date : String
    , description : String
    , id : String
    , imageSrc : String
    , isActive : Bool
    , isPublic : Bool
    , location : FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation
    , lookup : String
    , startTime : String
    , title : String
    }

type alias FireBaseEvents =
    { -KxuNWKdE2OOVkCaM6cg : FireBaseEvents-KxuNWKdE2OOVkCaM6cg
    , -KxzZi9Fes13OXqZTGj9 : FireBaseEvents-KxzZi9Fes13OXqZTGj9
    , -KxzZtArllZqYjA5zAiW : FireBaseEvents-KxzZtArllZqYjA5zAiW
    , -Kyb8nduQgewzJ9_wn2I : FireBaseEvents-Kyb8nduQgewzJ9_wn2I
    , -Kyb96-8BR0G8Ik-b-LA : FireBaseEvents-Kyb96-8BR0G8Ik-b-LA
    , -KzUkjyJ0Wks4IyVxrMs : FireBaseEvents-KzUkjyJ0Wks4IyVxrMs
    , d92e135b-8d30-4d51-ab0a-5181888ce19d : FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d
    }

type alias FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
    }

type alias FireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools3521816Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools3521816 =
    { swimmers : FireBasePools3521816Swimmers
    }

type alias FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    { sexuality : Int
    }

type alias FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
    }

type alias FireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools3658263Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools3658263 =
    { swimmers : FireBasePools3658263Swimmers
    }

type alias FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools3831916Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools3831916 =
    { swimmers : FireBasePools3831916Swimmers
    }

type alias FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , chatsSent : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , chatsFrom : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3909210Swimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    }

type alias FireBasePools3909210 =
    { swimmers : FireBasePools3909210Swimmers
    }

type alias FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools3921995Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , b6j5J35XorPWcG9x2501wlMYk6y1 : FireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1
    }

type alias FireBasePools3921995 =
    { swimmers : FireBasePools3921995Swimmers
    }

type alias FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    { y89tpPBrt1WTImzTsCMjAuhL4IA3 : String
    }

type alias FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , chatsFrom : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { age : Int
    , chatsSent : FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools3926655Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
    }

type alias FireBasePools3926655 =
    { swimmers : FireBasePools3926655Swimmers
    }

type alias FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent =
    { ogeM0vZAgETqD7tgDMkQnZGsRjP2 : String
    }

type alias FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Bool
    }

type alias FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { age : Int
    , chatsSent : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , passedUsers : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers
    }

type alias FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom =
    { xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : String
    }

type alias FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , chatsFrom : FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools4019294Swimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools4019294 =
    { swimmers : FireBasePools4019294Swimmers
    }

type alias FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4021513Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    }

type alias FireBasePools4021513 =
    { swimmers : FireBasePools4021513Swimmers
    }

type alias FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom =
    { ogeM0vZAgETqD7tgDMkQnZGsRjP2 : String
    }

type alias FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , chatsFrom : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , chatsSent : FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools4021514Swimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools4021514 =
    { swimmers : FireBasePools4021514Swimmers
    }

type alias FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools4064231Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools4064231 =
    { swimmers : FireBasePools4064231Swimmers
    }

type alias FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    }

type alias FireBasePools4070378Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

type alias FireBasePools4070378 =
    { swimmers : FireBasePools4070378Swimmers
    }

type alias FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4095807Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    }

type alias FireBasePools4095807 =
    { swimmers : FireBasePools4095807Swimmers
    }

type alias FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    { y89tpPBrt1WTImzTsCMjAuhL4IA3 : String
    }

type alias FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , chatsFrom : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdminUser : Bool
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    { sexuality : Int
    }

type alias FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { age : Int
    , chatsSent : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
    }

type alias FireBasePools4107551Swimmers =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
    }

type alias FireBasePools4107551 =
    { swimmers : FireBasePools4107551Swimmers
    }

type alias FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    }

type alias FireBasePools-KxuNWKdE2OOVkCaM6cg =
    { swimmers : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers
    }

type alias FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools-KxzZi9Fes13OXqZTGj9Swimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    }

type alias FireBasePools-KxzZi9Fes13OXqZTGj9 =
    { swimmers : FireBasePools-KxzZi9Fes13OXqZTGj9Swimmers
    }

type alias FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools-KxzZtArllZqYjA5zAiWSwimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    }

type alias FireBasePools-KxzZtArllZqYjA5zAiW =
    { swimmers : FireBasePools-KxzZtArllZqYjA5zAiWSwimmers
    }

type alias FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    }

type alias FireBasePools-Kyb8nduQgewzJ9_wn2I =
    { swimmers : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom =
    { xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : String
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , chatsFrom : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { age : Int
    , chatsSent : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    }

type alias FireBasePools-Kyb96-8BR0G8Ik-b-LA =
    { swimmers : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers
    }

type alias FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    { sexuality : Int
    }

type alias FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { age : Int
    , gender : Int
    , id : String
    , imageUrl : String
    , isGoing : Bool
    , name : String
    , preferences : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
    }

type alias FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers =
    { xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    }

type alias FireBasePools-KzUkjyJ0Wks4IyVxrMs =
    { swimmers : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers
    }

type alias FireBasePools =
    { 3521816 : FireBasePools3521816
    , 3658263 : FireBasePools3658263
    , 3831916 : FireBasePools3831916
    , 3909210 : FireBasePools3909210
    , 3921995 : FireBasePools3921995
    , 3926655 : FireBasePools3926655
    , 4019294 : FireBasePools4019294
    , 4021513 : FireBasePools4021513
    , 4021514 : FireBasePools4021514
    , 4064231 : FireBasePools4064231
    , 4070378 : FireBasePools4070378
    , 4095807 : FireBasePools4095807
    , 4107551 : FireBasePools4107551
    , -KxuNWKdE2OOVkCaM6cg : FireBasePools-KxuNWKdE2OOVkCaM6cg
    , -KxzZi9Fes13OXqZTGj9 : FireBasePools-KxzZi9Fes13OXqZTGj9
    , -KxzZtArllZqYjA5zAiW : FireBasePools-KxzZtArllZqYjA5zAiW
    , -Kyb8nduQgewzJ9_wn2I : FireBasePools-Kyb8nduQgewzJ9_wn2I
    , -Kyb96-8BR0G8Ik-b-LA : FireBasePools-Kyb96-8BR0G8Ik-b-LA
    , -KzUkjyJ0Wks4IyVxrMs : FireBasePools-KzUkjyJ0Wks4IyVxrMs
    }

type alias FireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 =
    { isLoggedIn : Bool
    , timeLastUpdated : Int
    }

type alias FireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { isLoggedIn : Bool
    , timeLastUpdated : Int
    }

type alias FireBasePresence =
    { hliOU22tQTXivqLHjjxuIfjIgjI3 : FireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3
    , vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2
    }

type alias FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites =
    { null : Bool
    }

type alias FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences =
    { sexuality : Int
    }

type alias FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 =
    { age : Int
    , email : String
    , favorites : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    , preferences : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 =
    { chatsSent : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom =
    { ogeM0vZAgETqD7tgDMkQnZGsRjP2 : String
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 =
    { chatsFrom : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg =
    { eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 =
    { eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW =
    { eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I =
    { eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom =
    { xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : String
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA =
    { chatsFrom : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom
    , eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events =
    { 3909210 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210
    , 4019294 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294
    , 4021514 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514
    , -KxuNWKdE2OOVkCaM6cg : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg
    , -KxzZi9Fes13OXqZTGj9 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9
    , -KxzZtArllZqYjA5zAiW : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW
    , -Kyb8nduQgewzJ9_wn2I : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I
    , -Kyb96-8BR0G8Ik-b-LA : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites =
    { null : Bool
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    { sexuality : Int
    }

type alias FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    { age : Int
    , bio : String
    , email : String
    , events : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events
    , favorites : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    , preferences : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
    }

type alias FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites =
    { null : Bool
    }

type alias FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 =
    { age : Int
    , email : String
    , favorites : FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites =
    { null : Bool
    }

type alias FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 =
    { age : Int
    , email : String
    , favorites : FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites =
    { null : Bool
    }

type alias FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 =
    { age : Int
    , email : String
    , favorites : FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 =
    { chatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom =
    { y89tpPBrt1WTImzTsCMjAuhL4IA3 : String
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 =
    { chatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom =
    { y89tpPBrt1WTImzTsCMjAuhL4IA3 : String
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 =
    { chatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events =
    { 3909210 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210
    , 3926655 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655
    , 4021513 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513
    , 4107551 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites =
    { null : Bool
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    { sexuality : Int
    }

type alias FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    { age : Int
    , bio : String
    , email : String
    , events : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events
    , favorites : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , isAdmin : Bool
    , lastName : String
    , preferences : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent =
    { ogeM0vZAgETqD7tgDMkQnZGsRjP2 : String
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Bool
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 =
    { chatsSent : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    , passedUsers : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA =
    { chatsSent : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent
    , eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs =
    { eventId : String
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events =
    { 3521816 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816
    , 4019294 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294
    , -Kyb96-8BR0G8Ik-b-LA : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA
    , -KzUkjyJ0Wks4IyVxrMs : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites =
    { null : Bool
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    { sexuality : Int
    }

type alias FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    { age : Int
    , bio : String
    , email : String
    , events : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events
    , favorites : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    , preferences : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 =
    { chatsSent : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent =
    { vG1yMgPN3afpyqxSUBcXxAixTaW2 : String
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 =
    { chatsSent : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events =
    { 3658263 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263
    , 3926655 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655
    , 4107551 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites =
    { null : Bool
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    { sexuality : Int
    }

type alias FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    { age : Int
    , email : String
    , events : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events
    , favorites : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    , preferences : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
    }

type alias FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events =
    { 3921995 : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995
    }

type alias FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites =
    { null : Bool
    }

type alias FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 =
    { age : Int
    , email : String
    , events : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events
    , favorites : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites =
    { null : Bool
    }

type alias FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 =
    { age : Int
    , email : String
    , favorites : FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom =
    { xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : String
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 =
    { chatsFrom : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent =
    { gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : String
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 =
    { chatsSent : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent
    , eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 =
    { eventId : Int
    , eventSource : Int
    , eventTitle : String
    , isGoing : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events =
    { 3521816 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816
    , 3658263 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263
    , 3831916 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916
    , 4019294 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294
    , 4021514 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514
    , 4064231 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231
    , 4070378 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites =
    { null : Bool
    }

type alias FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    { age : Int
    , events : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events
    , favorites : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites
    , firstName : String
    , gender : Int
    , id : String
    , imageUrl : String
    , lastName : String
    }

type alias FireBaseUsers =
    { eRadmcUfTJa6r5lEKnhfkbNKqH22 : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22
    , gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
    , hliOU22tQTXivqLHjjxuIfjIgjI3 : FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3
    , nTlc5urLzWcKVcczE5KnAHgJ5GC2 : FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2
    , nzYrYPYzAAan1S3Gcxb0ac0P4873 : FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873
    , vG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2
    , xKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
    , y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3
    , b6j5J35XorPWcG9x2501wlMYk6y1 : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1
    , ewkd6ryL5GYY8XbgL7FQTnsmTkY2 : FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2
    , ogeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2
    }

decodeFireBase : Json.Decode.Decoder FireBase
decodeFireBase =
    Json.Decode.succeed FireBase
        |: ("chatMessages" := decodeFireBaseChatMessages)
        |: ("chats" := decodeFireBaseChats)
        |: ("events" := decodeFireBaseEvents)
        |: ("pools" := decodeFireBasePools)
        |: ("presence" := decodeFireBasePresence)
        |: ("users" := decodeFireBaseUsers)

decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL : Json.Decode.Decoder FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL
decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL =
    Json.Decode.succeed FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h : Json.Decode.Decoder FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h
decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h =
    Json.Decode.succeed FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 : Json.Decode.Decoder FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6
decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 =
    Json.Decode.succeed FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6
        |: ("-KxLMk83wPAo2k8TMyuL" := decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL)
        |: ("-KxLMmwBdQkxvjjQoO2h" := decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h)

decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("-KxLMk7zLGqxdIOzsiG6" := decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6)

decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI
        |: ("-KybEvaMQFt5BwlgwHfM" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM)
        |: ("-KybIbm4-eGB2-R8N0_U" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U)
        |: ("-KzUko_CPRBOEHo9yEhG" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("-KybEva90QTw_a_VEsZI" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV
        |: ("-KybEGScpIR2ZHWA1X9O" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O)
        |: ("-KybEKsdZ4pTS7ghgdZi" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("-KybEGRljXC4R5uj5WfV" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV)

decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm
        |: ("-KxkR5mXgCV0WXveaKBm" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm)
        |: ("-KxkR7FNn7oABO6jizpg" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg)
        |: ("-Kxyd-zS6CSWlcnxvaJt" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt)
        |: ("-KyieaqxnI9kCoYojhks" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL
        |: ("-KzVgsXTAojOffX9DNQn" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn)
        |: ("-KzVgtyA01QahWHM_fVH" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("-KxkR5mShBbsnMh7QcTm" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm)
        |: ("-KzVgsXCuBLOAxbtH9tL" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL)

decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi : Json.Decode.Decoder FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi
decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi =
    Json.Decode.succeed FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF : Json.Decode.Decoder FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF
decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF =
    Json.Decode.succeed FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF
        |: ("isMilestoneMessage" := Json.Decode.bool)
        |: ("message" := Json.Decode.string)
        |: ("name" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN : Json.Decode.Decoder FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN
decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN =
    Json.Decode.succeed FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN
        |: ("-KxO93qLMlNkdSrvK1Bi" := decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi)
        |: ("-KxP5EEok6Ez_LjjGLdF" := decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF)

decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("-KxO93poardaJ2a-CqGN" := decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN)

decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2)

decodeFireBaseChatMessages : Json.Decode.Decoder FireBaseChatMessages
decodeFireBaseChatMessages =
    Json.Decode.succeed FireBaseChatMessages
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("-KxLMk7zLGqxdIOzsiG6" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser)
        |: ("eventId" := Json.Decode.string)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("-KybEva90QTw_a_VEsZI" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("-KxO93poardaJ2a-CqGN" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN)

decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("-KxLMk7zLGqxdIOzsiG6" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("-KxkR5mShBbsnMh7QcTm" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm)
        |: ("-KzVgsXCuBLOAxbtH9tL" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL)

decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser)
        |: ("eventId" := Json.Decode.string)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("-KybEva90QTw_a_VEsZI" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("-KybEGRljXC4R5uj5WfV" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV)

decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("-KxkR5mShBbsnMh7QcTm" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm)
        |: ("-KzVgsXCuBLOAxbtH9tL" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL)

decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("-KxO93poardaJ2a-CqGN" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser
        |: ("firstName" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("userId" := Json.Decode.string)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV
        |: ("chatUri" := Json.Decode.string)
        |: ("chatWithUser" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser)
        |: ("eventId" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("hasUnreadMessages" := Json.Decode.bool)
        |: ("id" := Json.Decode.string)
        |: ("lastMessage" := Json.Decode.string)
        |: ("lastMessageSenderId" := Json.Decode.string)
        |: ("timestamp" := Json.Decode.int)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("-KybEGRljXC4R5uj5WfV" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV)

decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2)

decodeFireBaseChats : Json.Decode.Decoder FireBaseChats
decodeFireBaseChats =
    Json.Decode.succeed FireBaseChats
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation : Json.Decode.Decoder FireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation
decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation =
    Json.Decode.succeed FireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg : Json.Decode.Decoder FireBaseEvents-KxuNWKdE2OOVkCaM6cg
decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg =
    Json.Decode.succeed FireBaseEvents-KxuNWKdE2OOVkCaM6cg
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location : Json.Decode.Decoder FireBaseEvents-KxzZi9Fes13OXqZTGj9Location
decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location =
    Json.Decode.succeed FireBaseEvents-KxzZi9Fes13OXqZTGj9Location
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9 : Json.Decode.Decoder FireBaseEvents-KxzZi9Fes13OXqZTGj9
decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9 =
    Json.Decode.succeed FireBaseEvents-KxzZi9Fes13OXqZTGj9
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation : Json.Decode.Decoder FireBaseEvents-KxzZtArllZqYjA5zAiWLocation
decodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation =
    Json.Decode.succeed FireBaseEvents-KxzZtArllZqYjA5zAiWLocation
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-KxzZtArllZqYjA5zAiW : Json.Decode.Decoder FireBaseEvents-KxzZtArllZqYjA5zAiW
decodeFireBaseEvents-KxzZtArllZqYjA5zAiW =
    Json.Decode.succeed FireBaseEvents-KxzZtArllZqYjA5zAiW
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageSrc" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation : Json.Decode.Decoder FireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation
decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation =
    Json.Decode.succeed FireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I : Json.Decode.Decoder FireBaseEvents-Kyb8nduQgewzJ9_wn2I
decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I =
    Json.Decode.succeed FireBaseEvents-Kyb8nduQgewzJ9_wn2I
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation : Json.Decode.Decoder FireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation
decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation =
    Json.Decode.succeed FireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA : Json.Decode.Decoder FireBaseEvents-Kyb96-8BR0G8Ik-b-LA
decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA =
    Json.Decode.succeed FireBaseEvents-Kyb96-8BR0G8Ik-b-LA
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageSrc" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation : Json.Decode.Decoder FireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation
decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation =
    Json.Decode.succeed FireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs : Json.Decode.Decoder FireBaseEvents-KzUkjyJ0Wks4IyVxrMs
decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs =
    Json.Decode.succeed FireBaseEvents-KzUkjyJ0Wks4IyVxrMs
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("eventCreatorUserId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageSrc" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation)
        |: ("privateLookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation : Json.Decode.Decoder FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation
decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation =
    Json.Decode.succeed FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation
        |: ("addressLine1" := Json.Decode.string)
        |: ("city" := Json.Decode.string)
        |: ("state" := Json.Decode.string)
        |: ("venue" := Json.Decode.string)

decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d : Json.Decode.Decoder FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d
decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d =
    Json.Decode.succeed FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d
        |: ("date" := Json.Decode.string)
        |: ("description" := Json.Decode.string)
        |: ("id" := Json.Decode.string)
        |: ("imageSrc" := Json.Decode.string)
        |: ("isActive" := Json.Decode.bool)
        |: ("isPublic" := Json.Decode.bool)
        |: ("location" := decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation)
        |: ("lookup" := Json.Decode.string)
        |: ("startTime" := Json.Decode.string)
        |: ("title" := Json.Decode.string)

decodeFireBaseEvents : Json.Decode.Decoder FireBaseEvents
decodeFireBaseEvents =
    Json.Decode.succeed FireBaseEvents
        |: ("-KxuNWKdE2OOVkCaM6cg" := decodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg)
        |: ("-KxzZi9Fes13OXqZTGj9" := decodeFireBaseEvents-KxzZi9Fes13OXqZTGj9)
        |: ("-KxzZtArllZqYjA5zAiW" := decodeFireBaseEvents-KxzZtArllZqYjA5zAiW)
        |: ("-Kyb8nduQgewzJ9_wn2I" := decodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I)
        |: ("-Kyb96-8BR0G8Ik-b-LA" := decodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA)
        |: ("-KzUkjyJ0Wks4IyVxrMs" := decodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs)
        |: ("d92e135b-8d30-4d51-ab0a-5181888ce19d" := decodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d)

decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : Json.Decode.Decoder FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    Json.Decode.succeed FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences)

decodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools3521816Swimmers : Json.Decode.Decoder FireBasePools3521816Swimmers
decodeFireBasePools3521816Swimmers =
    Json.Decode.succeed FireBasePools3521816Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools3521816 : Json.Decode.Decoder FireBasePools3521816
decodeFireBasePools3521816 =
    Json.Decode.succeed FireBasePools3521816
        |: ("swimmers" := decodeFireBasePools3521816Swimmers)

decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : Json.Decode.Decoder FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    Json.Decode.succeed FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences)

decodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools3658263Swimmers : Json.Decode.Decoder FireBasePools3658263Swimmers
decodeFireBasePools3658263Swimmers =
    Json.Decode.succeed FireBasePools3658263Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools3658263 : Json.Decode.Decoder FireBasePools3658263
decodeFireBasePools3658263 =
    Json.Decode.succeed FireBasePools3658263
        |: ("swimmers" := decodeFireBasePools3658263Swimmers)

decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools3831916Swimmers : Json.Decode.Decoder FireBasePools3831916Swimmers
decodeFireBasePools3831916Swimmers =
    Json.Decode.succeed FireBasePools3831916Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools3831916 : Json.Decode.Decoder FireBasePools3831916
decodeFireBasePools3831916 =
    Json.Decode.succeed FireBasePools3831916
        |: ("swimmers" := decodeFireBasePools3831916Swimmers)

decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent : Json.Decode.Decoder FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent
decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent =
    Json.Decode.succeed FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : Json.Decode.Decoder FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    Json.Decode.succeed FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3909210Swimmers : Json.Decode.Decoder FireBasePools3909210Swimmers
decodeFireBasePools3909210Swimmers =
    Json.Decode.succeed FireBasePools3909210Swimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBasePools3909210 : Json.Decode.Decoder FireBasePools3909210
decodeFireBasePools3909210 =
    Json.Decode.succeed FireBasePools3909210
        |: ("swimmers" := decodeFireBasePools3909210Swimmers)

decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 : Json.Decode.Decoder FireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1
decodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 =
    Json.Decode.succeed FireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools3921995Swimmers : Json.Decode.Decoder FireBasePools3921995Swimmers
decodeFireBasePools3921995Swimmers =
    Json.Decode.succeed FireBasePools3921995Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("b6j5J35XorPWcG9x2501wlMYk6y1" := decodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1)

decodeFireBasePools3921995 : Json.Decode.Decoder FireBasePools3921995
decodeFireBasePools3921995 =
    Json.Decode.succeed FireBasePools3921995
        |: ("swimmers" := decodeFireBasePools3921995Swimmers)

decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : Json.Decode.Decoder FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    Json.Decode.succeed FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := Json.Decode.string)

decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent : Json.Decode.Decoder FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent =
    Json.Decode.succeed FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools3926655Swimmers : Json.Decode.Decoder FireBasePools3926655Swimmers
decodeFireBasePools3926655Swimmers =
    Json.Decode.succeed FireBasePools3926655Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3)

decodeFireBasePools3926655 : Json.Decode.Decoder FireBasePools3926655
decodeFireBasePools3926655 =
    Json.Decode.succeed FireBasePools3926655
        |: ("swimmers" := decodeFireBasePools3926655Swimmers)

decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent : Json.Decode.Decoder FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent =
    Json.Decode.succeed FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := Json.Decode.string)

decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers : Json.Decode.Decoder FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers
decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers =
    Json.Decode.succeed FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.bool)

decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("passedUsers" := decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers)

decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom : Json.Decode.Decoder FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom
decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom =
    Json.Decode.succeed FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := Json.Decode.string)

decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools4019294Swimmers : Json.Decode.Decoder FireBasePools4019294Swimmers
decodeFireBasePools4019294Swimmers =
    Json.Decode.succeed FireBasePools4019294Swimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools4019294 : Json.Decode.Decoder FireBasePools4019294
decodeFireBasePools4019294 =
    Json.Decode.succeed FireBasePools4019294
        |: ("swimmers" := decodeFireBasePools4019294Swimmers)

decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4021513Swimmers : Json.Decode.Decoder FireBasePools4021513Swimmers
decodeFireBasePools4021513Swimmers =
    Json.Decode.succeed FireBasePools4021513Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBasePools4021513 : Json.Decode.Decoder FireBasePools4021513
decodeFireBasePools4021513 =
    Json.Decode.succeed FireBasePools4021513
        |: ("swimmers" := decodeFireBasePools4021513Swimmers)

decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom : Json.Decode.Decoder FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom =
    Json.Decode.succeed FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := Json.Decode.string)

decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent : Json.Decode.Decoder FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent
decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent =
    Json.Decode.succeed FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools4021514Swimmers : Json.Decode.Decoder FireBasePools4021514Swimmers
decodeFireBasePools4021514Swimmers =
    Json.Decode.succeed FireBasePools4021514Swimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools4021514 : Json.Decode.Decoder FireBasePools4021514
decodeFireBasePools4021514 =
    Json.Decode.succeed FireBasePools4021514
        |: ("swimmers" := decodeFireBasePools4021514Swimmers)

decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools4064231Swimmers : Json.Decode.Decoder FireBasePools4064231Swimmers
decodeFireBasePools4064231Swimmers =
    Json.Decode.succeed FireBasePools4064231Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools4064231 : Json.Decode.Decoder FireBasePools4064231
decodeFireBasePools4064231 =
    Json.Decode.succeed FireBasePools4064231
        |: ("swimmers" := decodeFireBasePools4064231Swimmers)

decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)

decodeFireBasePools4070378Swimmers : Json.Decode.Decoder FireBasePools4070378Swimmers
decodeFireBasePools4070378Swimmers =
    Json.Decode.succeed FireBasePools4070378Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

decodeFireBasePools4070378 : Json.Decode.Decoder FireBasePools4070378
decodeFireBasePools4070378 =
    Json.Decode.succeed FireBasePools4070378
        |: ("swimmers" := decodeFireBasePools4070378Swimmers)

decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4095807Swimmers : Json.Decode.Decoder FireBasePools4095807Swimmers
decodeFireBasePools4095807Swimmers =
    Json.Decode.succeed FireBasePools4095807Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBasePools4095807 : Json.Decode.Decoder FireBasePools4095807
decodeFireBasePools4095807 =
    Json.Decode.succeed FireBasePools4095807
        |: ("swimmers" := decodeFireBasePools4095807Swimmers)

decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : Json.Decode.Decoder FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom =
    Json.Decode.succeed FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := Json.Decode.string)

decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdminUser" := Json.Decode.bool)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent : Json.Decode.Decoder FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent =
    Json.Decode.succeed FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : Json.Decode.Decoder FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    Json.Decode.succeed FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences)

decodeFireBasePools4107551Swimmers : Json.Decode.Decoder FireBasePools4107551Swimmers
decodeFireBasePools4107551Swimmers =
    Json.Decode.succeed FireBasePools4107551Swimmers
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3)

decodeFireBasePools4107551 : Json.Decode.Decoder FireBasePools4107551
decodeFireBasePools4107551 =
    Json.Decode.succeed FireBasePools4107551
        |: ("swimmers" := decodeFireBasePools4107551Swimmers)

decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers : Json.Decode.Decoder FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers
decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers =
    Json.Decode.succeed FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)

decodeFireBasePools-KxuNWKdE2OOVkCaM6cg : Json.Decode.Decoder FireBasePools-KxuNWKdE2OOVkCaM6cg
decodeFireBasePools-KxuNWKdE2OOVkCaM6cg =
    Json.Decode.succeed FireBasePools-KxuNWKdE2OOVkCaM6cg
        |: ("swimmers" := decodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers)

decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers : Json.Decode.Decoder FireBasePools-KxzZi9Fes13OXqZTGj9Swimmers
decodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers =
    Json.Decode.succeed FireBasePools-KxzZi9Fes13OXqZTGj9Swimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)

decodeFireBasePools-KxzZi9Fes13OXqZTGj9 : Json.Decode.Decoder FireBasePools-KxzZi9Fes13OXqZTGj9
decodeFireBasePools-KxzZi9Fes13OXqZTGj9 =
    Json.Decode.succeed FireBasePools-KxzZi9Fes13OXqZTGj9
        |: ("swimmers" := decodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers)

decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers : Json.Decode.Decoder FireBasePools-KxzZtArllZqYjA5zAiWSwimmers
decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers =
    Json.Decode.succeed FireBasePools-KxzZtArllZqYjA5zAiWSwimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)

decodeFireBasePools-KxzZtArllZqYjA5zAiW : Json.Decode.Decoder FireBasePools-KxzZtArllZqYjA5zAiW
decodeFireBasePools-KxzZtArllZqYjA5zAiW =
    Json.Decode.succeed FireBasePools-KxzZtArllZqYjA5zAiW
        |: ("swimmers" := decodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers)

decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers : Json.Decode.Decoder FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers
decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers =
    Json.Decode.succeed FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)

decodeFireBasePools-Kyb8nduQgewzJ9_wn2I : Json.Decode.Decoder FireBasePools-Kyb8nduQgewzJ9_wn2I
decodeFireBasePools-Kyb8nduQgewzJ9_wn2I =
    Json.Decode.succeed FireBasePools-Kyb8nduQgewzJ9_wn2I
        |: ("swimmers" := decodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := Json.Decode.string)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("chatsFrom" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("age" := Json.Decode.int)
        |: ("chatsSent" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2)

decodeFireBasePools-Kyb96-8BR0G8Ik-b-LA : Json.Decode.Decoder FireBasePools-Kyb96-8BR0G8Ik-b-LA
decodeFireBasePools-Kyb96-8BR0G8Ik-b-LA =
    Json.Decode.succeed FireBasePools-Kyb96-8BR0G8Ik-b-LA
        |: ("swimmers" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers)

decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : Json.Decode.Decoder FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    Json.Decode.succeed FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("age" := Json.Decode.int)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("name" := Json.Decode.string)
        |: ("preferences" := decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences)

decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers : Json.Decode.Decoder FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers
decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers =
    Json.Decode.succeed FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2)

decodeFireBasePools-KzUkjyJ0Wks4IyVxrMs : Json.Decode.Decoder FireBasePools-KzUkjyJ0Wks4IyVxrMs
decodeFireBasePools-KzUkjyJ0Wks4IyVxrMs =
    Json.Decode.succeed FireBasePools-KzUkjyJ0Wks4IyVxrMs
        |: ("swimmers" := decodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers)

decodeFireBasePools : Json.Decode.Decoder FireBasePools
decodeFireBasePools =
    Json.Decode.succeed FireBasePools
        |: ("3521816" := decodeFireBasePools3521816)
        |: ("3658263" := decodeFireBasePools3658263)
        |: ("3831916" := decodeFireBasePools3831916)
        |: ("3909210" := decodeFireBasePools3909210)
        |: ("3921995" := decodeFireBasePools3921995)
        |: ("3926655" := decodeFireBasePools3926655)
        |: ("4019294" := decodeFireBasePools4019294)
        |: ("4021513" := decodeFireBasePools4021513)
        |: ("4021514" := decodeFireBasePools4021514)
        |: ("4064231" := decodeFireBasePools4064231)
        |: ("4070378" := decodeFireBasePools4070378)
        |: ("4095807" := decodeFireBasePools4095807)
        |: ("4107551" := decodeFireBasePools4107551)
        |: ("-KxuNWKdE2OOVkCaM6cg" := decodeFireBasePools-KxuNWKdE2OOVkCaM6cg)
        |: ("-KxzZi9Fes13OXqZTGj9" := decodeFireBasePools-KxzZi9Fes13OXqZTGj9)
        |: ("-KxzZtArllZqYjA5zAiW" := decodeFireBasePools-KxzZtArllZqYjA5zAiW)
        |: ("-Kyb8nduQgewzJ9_wn2I" := decodeFireBasePools-Kyb8nduQgewzJ9_wn2I)
        |: ("-Kyb96-8BR0G8Ik-b-LA" := decodeFireBasePools-Kyb96-8BR0G8Ik-b-LA)
        |: ("-KzUkjyJ0Wks4IyVxrMs" := decodeFireBasePools-KzUkjyJ0Wks4IyVxrMs)

decodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 : Json.Decode.Decoder FireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3
decodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 =
    Json.Decode.succeed FireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3
        |: ("isLoggedIn" := Json.Decode.bool)
        |: ("timeLastUpdated" := Json.Decode.int)

decodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("isLoggedIn" := Json.Decode.bool)
        |: ("timeLastUpdated" := Json.Decode.int)

decodeFireBasePresence : Json.Decode.Decoder FireBasePresence
decodeFireBasePresence =
    Json.Decode.succeed FireBasePresence
        |: ("hliOU22tQTXivqLHjjxuIfjIgjI3" := decodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3)
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2)

decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites : Json.Decode.Decoder FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites
decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites =
    Json.Decode.succeed FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences : Json.Decode.Decoder FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences
decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences =
    Json.Decode.succeed FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 : Json.Decode.Decoder FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22
decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 =
    Json.Decode.succeed FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("favorites" := decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)
        |: ("preferences" := decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210
        |: ("chatsSent" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := Json.Decode.string)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514
        |: ("chatsFrom" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := Json.Decode.string)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA
        |: ("chatsFrom" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom)
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events
        |: ("3909210" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210)
        |: ("4019294" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294)
        |: ("4021514" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514)
        |: ("-KxuNWKdE2OOVkCaM6cg" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg)
        |: ("-KxzZi9Fes13OXqZTGj9" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9)
        |: ("-KxzZtArllZqYjA5zAiW" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW)
        |: ("-Kyb8nduQgewzJ9_wn2I" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I)
        |: ("-Kyb96-8BR0G8Ik-b-LA" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : Json.Decode.Decoder FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 =
    Json.Decode.succeed FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2
        |: ("age" := Json.Decode.int)
        |: ("bio" := Json.Decode.string)
        |: ("email" := Json.Decode.string)
        |: ("events" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events)
        |: ("favorites" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)
        |: ("preferences" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences)

decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites : Json.Decode.Decoder FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites
decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites =
    Json.Decode.succeed FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 : Json.Decode.Decoder FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3
decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 =
    Json.Decode.succeed FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("favorites" := decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites : Json.Decode.Decoder FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites
decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites =
    Json.Decode.succeed FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 : Json.Decode.Decoder FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2
decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 =
    Json.Decode.succeed FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("favorites" := decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites : Json.Decode.Decoder FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites
decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites =
    Json.Decode.succeed FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 : Json.Decode.Decoder FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873
decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 =
    Json.Decode.succeed FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("favorites" := decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210
        |: ("chatsFrom" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := Json.Decode.string)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655
        |: ("chatsFrom" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := Json.Decode.string)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551
        |: ("chatsFrom" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events
        |: ("3909210" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210)
        |: ("3926655" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655)
        |: ("4021513" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513)
        |: ("4107551" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 : Json.Decode.Decoder FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2
decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 =
    Json.Decode.succeed FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2
        |: ("age" := Json.Decode.int)
        |: ("bio" := Json.Decode.string)
        |: ("email" := Json.Decode.string)
        |: ("events" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events)
        |: ("favorites" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("isAdmin" := Json.Decode.bool)
        |: ("lastName" := Json.Decode.string)
        |: ("preferences" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := Json.Decode.string)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.bool)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294
        |: ("chatsSent" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)
        |: ("passedUsers" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA
        |: ("chatsSent" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent)
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs
        |: ("eventId" := Json.Decode.string)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events
        |: ("3521816" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816)
        |: ("4019294" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294)
        |: ("-Kyb96-8BR0G8Ik-b-LA" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA)
        |: ("-KzUkjyJ0Wks4IyVxrMs" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : Json.Decode.Decoder FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 =
    Json.Decode.succeed FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2
        |: ("age" := Json.Decode.int)
        |: ("bio" := Json.Decode.string)
        |: ("email" := Json.Decode.string)
        |: ("events" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events)
        |: ("favorites" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)
        |: ("preferences" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655
        |: ("chatsSent" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := Json.Decode.string)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551
        |: ("chatsSent" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events
        |: ("3658263" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263)
        |: ("3926655" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655)
        |: ("4107551" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences
        |: ("sexuality" := Json.Decode.int)

decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 : Json.Decode.Decoder FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3
decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 =
    Json.Decode.succeed FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("events" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events)
        |: ("favorites" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)
        |: ("preferences" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences)

decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 : Json.Decode.Decoder FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995
decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 =
    Json.Decode.succeed FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events : Json.Decode.Decoder FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events
decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events =
    Json.Decode.succeed FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events
        |: ("3921995" := decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995)

decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites : Json.Decode.Decoder FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites
decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites =
    Json.Decode.succeed FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 : Json.Decode.Decoder FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1
decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 =
    Json.Decode.succeed FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("events" := decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events)
        |: ("favorites" := decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites : Json.Decode.Decoder FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites
decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites =
    Json.Decode.succeed FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 : Json.Decode.Decoder FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2
decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 =
    Json.Decode.succeed FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2
        |: ("age" := Json.Decode.int)
        |: ("email" := Json.Decode.string)
        |: ("favorites" := decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := Json.Decode.string)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294
        |: ("chatsFrom" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := Json.Decode.string)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514
        |: ("chatsSent" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent)
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378
        |: ("eventId" := Json.Decode.int)
        |: ("eventSource" := Json.Decode.int)
        |: ("eventTitle" := Json.Decode.string)
        |: ("isGoing" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events
        |: ("3521816" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816)
        |: ("3658263" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263)
        |: ("3831916" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916)
        |: ("4019294" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294)
        |: ("4021514" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514)
        |: ("4064231" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231)
        |: ("4070378" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites
        |: ("null" := Json.Decode.bool)

decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : Json.Decode.Decoder FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2
decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 =
    Json.Decode.succeed FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2
        |: ("age" := Json.Decode.int)
        |: ("events" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events)
        |: ("favorites" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites)
        |: ("firstName" := Json.Decode.string)
        |: ("gender" := Json.Decode.int)
        |: ("id" := Json.Decode.string)
        |: ("imageUrl" := Json.Decode.string)
        |: ("lastName" := Json.Decode.string)

decodeFireBaseUsers : Json.Decode.Decoder FireBaseUsers
decodeFireBaseUsers =
    Json.Decode.succeed FireBaseUsers
        |: ("eRadmcUfTJa6r5lEKnhfkbNKqH22" := decodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22)
        |: ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2" := decodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        |: ("hliOU22tQTXivqLHjjxuIfjIgjI3" := decodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3)
        |: ("nTlc5urLzWcKVcczE5KnAHgJ5GC2" := decodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2)
        |: ("nzYrYPYzAAan1S3Gcxb0ac0P4873" := decodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873)
        |: ("vG1yMgPN3afpyqxSUBcXxAixTaW2" := decodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2)
        |: ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2" := decodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        |: ("y89tpPBrt1WTImzTsCMjAuhL4IA3" := decodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3)
        |: ("b6j5J35XorPWcG9x2501wlMYk6y1" := decodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1)
        |: ("ewkd6ryL5GYY8XbgL7FQTnsmTkY2" := decodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2)
        |: ("ogeM0vZAgETqD7tgDMkQnZGsRjP2" := decodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2)

encodeFireBase : FireBase -> Json.Encode.Value
encodeFireBase record =
    Json.Encode.object
        [ ("chatMessages",  encodeFireBaseChatMessages <| record.chatMessages)
        , ("chats",  encodeFireBaseChats <| record.chats)
        , ("events",  encodeFireBaseEvents <| record.events)
        , ("pools",  encodeFireBasePools <| record.pools)
        , ("presence",  encodeFireBasePresence <| record.presence)
        , ("users",  encodeFireBaseUsers <| record.users)
        ]

encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL : FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL -> Json.Encode.Value
encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h : FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h -> Json.Encode.Value
encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 : FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 -> Json.Encode.Value
encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 record =
    Json.Encode.object
        [ ("-KxLMk83wPAo2k8TMyuL",  encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMk83wPAo2k8TMyuL <| record.-KxLMk83wPAo2k8TMyuL)
        , ("-KxLMmwBdQkxvjjQoO2h",  encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6-KxLMmwBdQkxvjjQoO2h <| record.-KxLMmwBdQkxvjjQoO2h)
        ]

encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("-KxLMk7zLGqxdIOzsiG6",  encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 <| record.-KxLMk7zLGqxdIOzsiG6)
        ]

encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI record =
    Json.Encode.object
        [ ("-KybEvaMQFt5BwlgwHfM",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybEvaMQFt5BwlgwHfM <| record.-KybEvaMQFt5BwlgwHfM)
        , ("-KybIbm4-eGB2-R8N0_U",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KybIbm4-eGB2-R8N0_U <| record.-KybIbm4-eGB2-R8N0_U)
        , ("-KzUko_CPRBOEHo9yEhG",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI-KzUko_CPRBOEHo9yEhG <| record.-KzUko_CPRBOEHo9yEhG)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("-KybEva90QTw_a_VEsZI",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI <| record.-KybEva90QTw_a_VEsZI)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV record =
    Json.Encode.object
        [ ("-KybEGScpIR2ZHWA1X9O",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEGScpIR2ZHWA1X9O <| record.-KybEGScpIR2ZHWA1X9O)
        , ("-KybEKsdZ4pTS7ghgdZi",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV-KybEKsdZ4pTS7ghgdZi <| record.-KybEKsdZ4pTS7ghgdZi)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("-KybEGRljXC4R5uj5WfV",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV <| record.-KybEGRljXC4R5uj5WfV)
        ]

encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm record =
    Json.Encode.object
        [ ("-KxkR5mXgCV0WXveaKBm",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR5mXgCV0WXveaKBm <| record.-KxkR5mXgCV0WXveaKBm)
        , ("-KxkR7FNn7oABO6jizpg",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KxkR7FNn7oABO6jizpg <| record.-KxkR7FNn7oABO6jizpg)
        , ("-Kxyd-zS6CSWlcnxvaJt",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-Kxyd-zS6CSWlcnxvaJt <| record.-Kxyd-zS6CSWlcnxvaJt)
        , ("-KyieaqxnI9kCoYojhks",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm-KyieaqxnI9kCoYojhks <| record.-KyieaqxnI9kCoYojhks)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL record =
    Json.Encode.object
        [ ("-KzVgsXTAojOffX9DNQn",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgsXTAojOffX9DNQn <| record.-KzVgsXTAojOffX9DNQn)
        , ("-KzVgtyA01QahWHM_fVH",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL-KzVgtyA01QahWHM_fVH <| record.-KzVgtyA01QahWHM_fVH)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("-KxkR5mShBbsnMh7QcTm",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm <| record.-KxkR5mShBbsnMh7QcTm)
        , ("-KzVgsXCuBLOAxbtH9tL",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL <| record.-KzVgsXCuBLOAxbtH9tL)
        ]

encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi : FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi -> Json.Encode.Value
encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF : FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF -> Json.Encode.Value
encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF record =
    Json.Encode.object
        [ ("isMilestoneMessage",  Json.Encode.bool <| record.isMilestoneMessage)
        , ("message",  Json.Encode.string <| record.message)
        , ("name",  Json.Encode.string <| record.name)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN : FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN -> Json.Encode.Value
encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN record =
    Json.Encode.object
        [ ("-KxO93qLMlNkdSrvK1Bi",  encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxO93qLMlNkdSrvK1Bi <| record.-KxO93qLMlNkdSrvK1Bi)
        , ("-KxP5EEok6Ez_LjjGLdF",  encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN-KxP5EEok6Ez_LjjGLdF <| record.-KxP5EEok6Ez_LjjGLdF)
        ]

encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("-KxO93poardaJ2a-CqGN",  encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN <| record.-KxO93poardaJ2a-CqGN)
        ]

encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBaseChatMessages : FireBaseChatMessages -> Json.Encode.Value
encodeFireBaseChatMessages record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatMessagesGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBaseChatMessagesXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBaseChatMessagesY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseChatMessagesOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6ChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("-KxLMk7zLGqxdIOzsiG6",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2-KxLMk7zLGqxdIOzsiG6 <| record.-KxLMk7zLGqxdIOzsiG6)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZIChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("-KybEva90QTw_a_VEsZI",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEva90QTw_a_VEsZI <| record.-KybEva90QTw_a_VEsZI)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGNChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("-KxO93poardaJ2a-CqGN",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KxO93poardaJ2a-CqGN <| record.-KxO93poardaJ2a-CqGN)
        ]

encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2VG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2OgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6ChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("-KxLMk7zLGqxdIOzsiG6",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxLMk7zLGqxdIOzsiG6 <| record.-KxLMk7zLGqxdIOzsiG6)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTmChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tLChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("-KxkR5mShBbsnMh7QcTm",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KxkR5mShBbsnMh7QcTm <| record.-KxkR5mShBbsnMh7QcTm)
        , ("-KzVgsXCuBLOAxbtH9tL",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3-KzVgsXCuBLOAxbtH9tL <| record.-KzVgsXCuBLOAxbtH9tL)
        ]

encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2Y89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZIChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("-KybEva90QTw_a_VEsZI",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KybEva90QTw_a_VEsZI <| record.-KybEva90QTw_a_VEsZI)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfVChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("-KybEGRljXC4R5uj5WfV",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2-KybEGRljXC4R5uj5WfV <| record.-KybEGRljXC4R5uj5WfV)
        ]

encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2OgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTmChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tLChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("-KxkR5mShBbsnMh7QcTm",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KxkR5mShBbsnMh7QcTm <| record.-KxkR5mShBbsnMh7QcTm)
        , ("-KzVgsXCuBLOAxbtH9tL",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2-KzVgsXCuBLOAxbtH9tL <| record.-KzVgsXCuBLOAxbtH9tL)
        ]

encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3VG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGNChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("-KxO93poardaJ2a-CqGN",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2-KxO93poardaJ2a-CqGN <| record.-KxO93poardaJ2a-CqGN)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser record =
    Json.Encode.object
        [ ("firstName",  Json.Encode.string <| record.firstName)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("userId",  Json.Encode.string <| record.userId)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV record =
    Json.Encode.object
        [ ("chatUri",  Json.Encode.string <| record.chatUri)
        , ("chatWithUser",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfVChatWithUser <| record.chatWithUser)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("hasUnreadMessages",  Json.Encode.bool <| record.hasUnreadMessages)
        , ("id",  Json.Encode.string <| record.id)
        , ("lastMessage",  Json.Encode.string <| record.lastMessage)
        , ("lastMessageSenderId",  Json.Encode.string <| record.lastMessageSenderId)
        , ("timestamp",  Json.Encode.int <| record.timestamp)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("-KybEGRljXC4R5uj5WfV",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2-KybEGRljXC4R5uj5WfV <| record.-KybEGRljXC4R5uj5WfV)
        ]

encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2Gb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2XKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBaseChats : FireBaseChats -> Json.Encode.Value
encodeFireBaseChats record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseChatsGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseChatsVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBaseChatsXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBaseChatsY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseChatsOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation : FireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation -> Json.Encode.Value
encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg : FireBaseEvents-KxuNWKdE2OOVkCaM6cg -> Json.Encode.Value
encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cgLocation <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location : FireBaseEvents-KxzZi9Fes13OXqZTGj9Location -> Json.Encode.Value
encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9 : FireBaseEvents-KxzZi9Fes13OXqZTGj9 -> Json.Encode.Value
encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9 record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9Location <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation : FireBaseEvents-KxzZtArllZqYjA5zAiWLocation -> Json.Encode.Value
encodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-KxzZtArllZqYjA5zAiW : FireBaseEvents-KxzZtArllZqYjA5zAiW -> Json.Encode.Value
encodeFireBaseEvents-KxzZtArllZqYjA5zAiW record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageSrc",  Json.Encode.string <| record.imageSrc)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-KxzZtArllZqYjA5zAiWLocation <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation : FireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation -> Json.Encode.Value
encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I : FireBaseEvents-Kyb8nduQgewzJ9_wn2I -> Json.Encode.Value
encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2ILocation <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation : FireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation -> Json.Encode.Value
encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA : FireBaseEvents-Kyb96-8BR0G8Ik-b-LA -> Json.Encode.Value
encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageSrc",  Json.Encode.string <| record.imageSrc)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LALocation <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation : FireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation -> Json.Encode.Value
encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation record =
    Json.Encode.object
        [ ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs : FireBaseEvents-KzUkjyJ0Wks4IyVxrMs -> Json.Encode.Value
encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("eventCreatorUserId",  Json.Encode.string <| record.eventCreatorUserId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageSrc",  Json.Encode.string <| record.imageSrc)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMsLocation <| record.location)
        , ("privateLookup",  Json.Encode.string <| record.privateLookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation : FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation -> Json.Encode.Value
encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation record =
    Json.Encode.object
        [ ("addressLine1",  Json.Encode.string <| record.addressLine1)
        , ("city",  Json.Encode.string <| record.city)
        , ("state",  Json.Encode.string <| record.state)
        , ("venue",  Json.Encode.string <| record.venue)
        ]

encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d : FireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d -> Json.Encode.Value
encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d record =
    Json.Encode.object
        [ ("date",  Json.Encode.string <| record.date)
        , ("description",  Json.Encode.string <| record.description)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageSrc",  Json.Encode.string <| record.imageSrc)
        , ("isActive",  Json.Encode.bool <| record.isActive)
        , ("isPublic",  Json.Encode.bool <| record.isPublic)
        , ("location",  encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19dLocation <| record.location)
        , ("lookup",  Json.Encode.string <| record.lookup)
        , ("startTime",  Json.Encode.string <| record.startTime)
        , ("title",  Json.Encode.string <| record.title)
        ]

encodeFireBaseEvents : FireBaseEvents -> Json.Encode.Value
encodeFireBaseEvents record =
    Json.Encode.object
        [ ("-KxuNWKdE2OOVkCaM6cg",  encodeFireBaseEvents-KxuNWKdE2OOVkCaM6cg <| record.-KxuNWKdE2OOVkCaM6cg)
        , ("-KxzZi9Fes13OXqZTGj9",  encodeFireBaseEvents-KxzZi9Fes13OXqZTGj9 <| record.-KxzZi9Fes13OXqZTGj9)
        , ("-KxzZtArllZqYjA5zAiW",  encodeFireBaseEvents-KxzZtArllZqYjA5zAiW <| record.-KxzZtArllZqYjA5zAiW)
        , ("-Kyb8nduQgewzJ9_wn2I",  encodeFireBaseEvents-Kyb8nduQgewzJ9_wn2I <| record.-Kyb8nduQgewzJ9_wn2I)
        , ("-Kyb96-8BR0G8Ik-b-LA",  encodeFireBaseEvents-Kyb96-8BR0G8Ik-b-LA <| record.-Kyb96-8BR0G8Ik-b-LA)
        , ("-KzUkjyJ0Wks4IyVxrMs",  encodeFireBaseEvents-KzUkjyJ0Wks4IyVxrMs <| record.-KzUkjyJ0Wks4IyVxrMs)
        , ("d92e135b-8d30-4d51-ab0a-5181888ce19d",  encodeFireBaseEventsD92e135b-8d30-4d51-ab0a-5181888ce19d <| record.d92e135b-8d30-4d51-ab0a-5181888ce19d)
        ]

encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences -> Json.Encode.Value
encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences <| record.preferences)
        ]

encodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools3521816Swimmers : FireBasePools3521816Swimmers -> Json.Encode.Value
encodeFireBasePools3521816Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3521816SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBasePools3521816SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools3521816SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools3521816 : FireBasePools3521816 -> Json.Encode.Value
encodeFireBasePools3521816 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3521816Swimmers <| record.swimmers)
        ]

encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences -> Json.Encode.Value
encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences <| record.preferences)
        ]

encodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools3658263Swimmers : FireBasePools3658263Swimmers -> Json.Encode.Value
encodeFireBasePools3658263Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3658263SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBasePools3658263SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools3658263SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools3658263 : FireBasePools3658263 -> Json.Encode.Value
encodeFireBasePools3658263 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3658263Swimmers <| record.swimmers)
        ]

encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools3831916Swimmers : FireBasePools3831916Swimmers -> Json.Encode.Value
encodeFireBasePools3831916Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3831916SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools3831916SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools3831916 : FireBasePools3831916 -> Json.Encode.Value
encodeFireBasePools3831916 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3831916Swimmers <| record.swimmers)
        ]

encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent -> Json.Encode.Value
encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom -> Json.Encode.Value
encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3909210Swimmers : FireBasePools3909210Swimmers -> Json.Encode.Value
encodeFireBasePools3909210Swimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools3909210SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3909210SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools3909210 : FireBasePools3909210 -> Json.Encode.Value
encodeFireBasePools3909210 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3909210Swimmers <| record.swimmers)
        ]

encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 : FireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 -> Json.Encode.Value
encodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools3921995Swimmers : FireBasePools3921995Swimmers -> Json.Encode.Value
encodeFireBasePools3921995Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3921995SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("b6j5J35XorPWcG9x2501wlMYk6y1",  encodeFireBasePools3921995SwimmersB6j5J35XorPWcG9x2501wlMYk6y1 <| record.b6j5J35XorPWcG9x2501wlMYk6y1)
        ]

encodeFireBasePools3921995 : FireBasePools3921995 -> Json.Encode.Value
encodeFireBasePools3921995 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3921995Swimmers <| record.swimmers)
        ]

encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom -> Json.Encode.Value
encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom record =
    Json.Encode.object
        [ ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  Json.Encode.string <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent : FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent -> Json.Encode.Value
encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools3926655Swimmers : FireBasePools3926655Swimmers -> Json.Encode.Value
encodeFireBasePools3926655Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools3926655SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBasePools3926655SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBasePools3926655 : FireBasePools3926655 -> Json.Encode.Value
encodeFireBasePools3926655 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools3926655Swimmers <| record.swimmers)
        ]

encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent -> Json.Encode.Value
encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent record =
    Json.Encode.object
        [ ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  Json.Encode.string <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers -> Json.Encode.Value
encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.bool <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("passedUsers",  encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2PassedUsers <| record.passedUsers)
        ]

encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom : FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom -> Json.Encode.Value
encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom record =
    Json.Encode.object
        [ ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  Json.Encode.string <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools4019294Swimmers : FireBasePools4019294Swimmers -> Json.Encode.Value
encodeFireBasePools4019294Swimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools4019294SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4019294SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBasePools4019294SwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools4019294SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4019294 : FireBasePools4019294 -> Json.Encode.Value
encodeFireBasePools4019294 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4019294Swimmers <| record.swimmers)
        ]

encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4021513Swimmers : FireBasePools4021513Swimmers -> Json.Encode.Value
encodeFireBasePools4021513Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4021513SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools4021513 : FireBasePools4021513 -> Json.Encode.Value
encodeFireBasePools4021513 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4021513Swimmers <| record.swimmers)
        ]

encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom -> Json.Encode.Value
encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom record =
    Json.Encode.object
        [ ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  Json.Encode.string <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent : FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent -> Json.Encode.Value
encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools4021514Swimmers : FireBasePools4021514Swimmers -> Json.Encode.Value
encodeFireBasePools4021514Swimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools4021514SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools4021514SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4021514 : FireBasePools4021514 -> Json.Encode.Value
encodeFireBasePools4021514 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4021514Swimmers <| record.swimmers)
        ]

encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools4064231Swimmers : FireBasePools4064231Swimmers -> Json.Encode.Value
encodeFireBasePools4064231Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4064231SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools4064231SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4064231 : FireBasePools4064231 -> Json.Encode.Value
encodeFireBasePools4064231 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4064231Swimmers <| record.swimmers)
        ]

encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        ]

encodeFireBasePools4070378Swimmers : FireBasePools4070378Swimmers -> Json.Encode.Value
encodeFireBasePools4070378Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4070378SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBasePools4070378SwimmersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBasePools4070378 : FireBasePools4070378 -> Json.Encode.Value
encodeFireBasePools4070378 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4070378Swimmers <| record.swimmers)
        ]

encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4095807Swimmers : FireBasePools4095807Swimmers -> Json.Encode.Value
encodeFireBasePools4095807Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4095807SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools4095807 : FireBasePools4095807 -> Json.Encode.Value
encodeFireBasePools4095807 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4095807Swimmers <| record.swimmers)
        ]

encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom -> Json.Encode.Value
encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom record =
    Json.Encode.object
        [ ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  Json.Encode.string <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdminUser",  Json.Encode.bool <| record.isAdminUser)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent -> Json.Encode.Value
encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences -> Json.Encode.Value
encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences <| record.preferences)
        ]

encodeFireBasePools4107551Swimmers : FireBasePools4107551Swimmers -> Json.Encode.Value
encodeFireBasePools4107551Swimmers record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePools4107551SwimmersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBasePools4107551SwimmersY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBasePools4107551 : FireBasePools4107551 -> Json.Encode.Value
encodeFireBasePools4107551 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools4107551Swimmers <| record.swimmers)
        ]

encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers : FireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers -> Json.Encode.Value
encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools-KxuNWKdE2OOVkCaM6cg : FireBasePools-KxuNWKdE2OOVkCaM6cg -> Json.Encode.Value
encodeFireBasePools-KxuNWKdE2OOVkCaM6cg record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-KxuNWKdE2OOVkCaM6cgSwimmers <| record.swimmers)
        ]

encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers : FireBasePools-KxzZi9Fes13OXqZTGj9Swimmers -> Json.Encode.Value
encodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools-KxzZi9Fes13OXqZTGj9SwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools-KxzZi9Fes13OXqZTGj9 : FireBasePools-KxzZi9Fes13OXqZTGj9 -> Json.Encode.Value
encodeFireBasePools-KxzZi9Fes13OXqZTGj9 record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-KxzZi9Fes13OXqZTGj9Swimmers <| record.swimmers)
        ]

encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers : FireBasePools-KxzZtArllZqYjA5zAiWSwimmers -> Json.Encode.Value
encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools-KxzZtArllZqYjA5zAiW : FireBasePools-KxzZtArllZqYjA5zAiW -> Json.Encode.Value
encodeFireBasePools-KxzZtArllZqYjA5zAiW record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-KxzZtArllZqYjA5zAiWSwimmers <| record.swimmers)
        ]

encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers : FireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers -> Json.Encode.Value
encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools-Kyb8nduQgewzJ9_wn2I : FireBasePools-Kyb8nduQgewzJ9_wn2I -> Json.Encode.Value
encodeFireBasePools-Kyb8nduQgewzJ9_wn2I record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-Kyb8nduQgewzJ9_wn2ISwimmers <| record.swimmers)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom record =
    Json.Encode.object
        [ ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  Json.Encode.string <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsFrom",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2ChatsFrom <| record.chatsFrom)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("chatsSent",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2ChatsSent <| record.chatsSent)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences <| record.preferences)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers : FireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBasePools-Kyb96-8BR0G8Ik-b-LA : FireBasePools-Kyb96-8BR0G8Ik-b-LA -> Json.Encode.Value
encodeFireBasePools-Kyb96-8BR0G8Ik-b-LA record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LASwimmers <| record.swimmers)
        ]

encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences -> Json.Encode.Value
encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("name",  Json.Encode.string <| record.name)
        , ("preferences",  encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences <| record.preferences)
        ]

encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers : FireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers -> Json.Encode.Value
encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers record =
    Json.Encode.object
        [ ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBasePools-KzUkjyJ0Wks4IyVxrMs : FireBasePools-KzUkjyJ0Wks4IyVxrMs -> Json.Encode.Value
encodeFireBasePools-KzUkjyJ0Wks4IyVxrMs record =
    Json.Encode.object
        [ ("swimmers",  encodeFireBasePools-KzUkjyJ0Wks4IyVxrMsSwimmers <| record.swimmers)
        ]

encodeFireBasePools : FireBasePools -> Json.Encode.Value
encodeFireBasePools record =
    Json.Encode.object
        [ ("3521816",  encodeFireBasePools3521816 <| record.3521816)
        , ("3658263",  encodeFireBasePools3658263 <| record.3658263)
        , ("3831916",  encodeFireBasePools3831916 <| record.3831916)
        , ("3909210",  encodeFireBasePools3909210 <| record.3909210)
        , ("3921995",  encodeFireBasePools3921995 <| record.3921995)
        , ("3926655",  encodeFireBasePools3926655 <| record.3926655)
        , ("4019294",  encodeFireBasePools4019294 <| record.4019294)
        , ("4021513",  encodeFireBasePools4021513 <| record.4021513)
        , ("4021514",  encodeFireBasePools4021514 <| record.4021514)
        , ("4064231",  encodeFireBasePools4064231 <| record.4064231)
        , ("4070378",  encodeFireBasePools4070378 <| record.4070378)
        , ("4095807",  encodeFireBasePools4095807 <| record.4095807)
        , ("4107551",  encodeFireBasePools4107551 <| record.4107551)
        , ("-KxuNWKdE2OOVkCaM6cg",  encodeFireBasePools-KxuNWKdE2OOVkCaM6cg <| record.-KxuNWKdE2OOVkCaM6cg)
        , ("-KxzZi9Fes13OXqZTGj9",  encodeFireBasePools-KxzZi9Fes13OXqZTGj9 <| record.-KxzZi9Fes13OXqZTGj9)
        , ("-KxzZtArllZqYjA5zAiW",  encodeFireBasePools-KxzZtArllZqYjA5zAiW <| record.-KxzZtArllZqYjA5zAiW)
        , ("-Kyb8nduQgewzJ9_wn2I",  encodeFireBasePools-Kyb8nduQgewzJ9_wn2I <| record.-Kyb8nduQgewzJ9_wn2I)
        , ("-Kyb96-8BR0G8Ik-b-LA",  encodeFireBasePools-Kyb96-8BR0G8Ik-b-LA <| record.-Kyb96-8BR0G8Ik-b-LA)
        , ("-KzUkjyJ0Wks4IyVxrMs",  encodeFireBasePools-KzUkjyJ0Wks4IyVxrMs <| record.-KzUkjyJ0Wks4IyVxrMs)
        ]

encodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 : FireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 -> Json.Encode.Value
encodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 record =
    Json.Encode.object
        [ ("isLoggedIn",  Json.Encode.bool <| record.isLoggedIn)
        , ("timeLastUpdated",  Json.Encode.int <| record.timeLastUpdated)
        ]

encodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("isLoggedIn",  Json.Encode.bool <| record.isLoggedIn)
        , ("timeLastUpdated",  Json.Encode.int <| record.timeLastUpdated)
        ]

encodeFireBasePresence : FireBasePresence -> Json.Encode.Value
encodeFireBasePresence record =
    Json.Encode.object
        [ ("hliOU22tQTXivqLHjjxuIfjIgjI3",  encodeFireBasePresenceHliOU22tQTXivqLHjjxuIfjIgjI3 <| record.hliOU22tQTXivqLHjjxuIfjIgjI3)
        , ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBasePresenceVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites -> Json.Encode.Value
encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences -> Json.Encode.Value
encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 : FireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 -> Json.Encode.Value
encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("favorites",  encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        , ("preferences",  encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22Preferences <| record.preferences)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210ChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom record =
    Json.Encode.object
        [ ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  Json.Encode.string <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514ChatsFrom <| record.chatsFrom)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom record =
    Json.Encode.object
        [ ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  Json.Encode.string <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LAChatsFrom <| record.chatsFrom)
        , ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events record =
    Json.Encode.object
        [ ("3909210",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events3909210 <| record.3909210)
        , ("4019294",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4019294 <| record.4019294)
        , ("4021514",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events4021514 <| record.4021514)
        , ("-KxuNWKdE2OOVkCaM6cg",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxuNWKdE2OOVkCaM6cg <| record.-KxuNWKdE2OOVkCaM6cg)
        , ("-KxzZi9Fes13OXqZTGj9",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZi9Fes13OXqZTGj9 <| record.-KxzZi9Fes13OXqZTGj9)
        , ("-KxzZtArllZqYjA5zAiW",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-KxzZtArllZqYjA5zAiW <| record.-KxzZtArllZqYjA5zAiW)
        , ("-Kyb8nduQgewzJ9_wn2I",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb8nduQgewzJ9_wn2I <| record.-Kyb8nduQgewzJ9_wn2I)
        , ("-Kyb96-8BR0G8Ik-b-LA",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events-Kyb96-8BR0G8Ik-b-LA <| record.-Kyb96-8BR0G8Ik-b-LA)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 : FireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 -> Json.Encode.Value
encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("bio",  Json.Encode.string <| record.bio)
        , ("email",  Json.Encode.string <| record.email)
        , ("events",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Events <| record.events)
        , ("favorites",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        , ("preferences",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2Preferences <| record.preferences)
        ]

encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites : FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites -> Json.Encode.Value
encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 : FireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 -> Json.Encode.Value
encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("favorites",  encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites : FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites -> Json.Encode.Value
encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 : FireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 -> Json.Encode.Value
encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("favorites",  encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites : FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites -> Json.Encode.Value
encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 : FireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 -> Json.Encode.Value
encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("favorites",  encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210ChatsFrom <| record.chatsFrom)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom record =
    Json.Encode.object
        [ ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  Json.Encode.string <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655ChatsFrom <| record.chatsFrom)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom record =
    Json.Encode.object
        [ ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  Json.Encode.string <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551ChatsFrom <| record.chatsFrom)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events record =
    Json.Encode.object
        [ ("3909210",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3909210 <| record.3909210)
        , ("3926655",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events3926655 <| record.3926655)
        , ("4021513",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4021513 <| record.4021513)
        , ("4107551",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events4107551 <| record.4107551)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 : FireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 -> Json.Encode.Value
encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("bio",  Json.Encode.string <| record.bio)
        , ("email",  Json.Encode.string <| record.email)
        , ("events",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Events <| record.events)
        , ("favorites",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("isAdmin",  Json.Encode.bool <| record.isAdmin)
        , ("lastName",  Json.Encode.string <| record.lastName)
        , ("preferences",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2Preferences <| record.preferences)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent record =
    Json.Encode.object
        [ ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  Json.Encode.string <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.bool <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294ChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        , ("passedUsers",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294PassedUsers <| record.passedUsers)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LAChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.string <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events record =
    Json.Encode.object
        [ ("3521816",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events3521816 <| record.3521816)
        , ("4019294",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events4019294 <| record.4019294)
        , ("-Kyb96-8BR0G8Ik-b-LA",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-Kyb96-8BR0G8Ik-b-LA <| record.-Kyb96-8BR0G8Ik-b-LA)
        , ("-KzUkjyJ0Wks4IyVxrMs",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events-KzUkjyJ0Wks4IyVxrMs <| record.-KzUkjyJ0Wks4IyVxrMs)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 : FireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 -> Json.Encode.Value
encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("bio",  Json.Encode.string <| record.bio)
        , ("email",  Json.Encode.string <| record.email)
        , ("events",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Events <| record.events)
        , ("favorites",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        , ("preferences",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2Preferences <| record.preferences)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655ChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent record =
    Json.Encode.object
        [ ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  Json.Encode.string <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551ChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events record =
    Json.Encode.object
        [ ("3658263",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3658263 <| record.3658263)
        , ("3926655",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events3926655 <| record.3926655)
        , ("4107551",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events4107551 <| record.4107551)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences record =
    Json.Encode.object
        [ ("sexuality",  Json.Encode.int <| record.sexuality)
        ]

encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 : FireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 -> Json.Encode.Value
encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("events",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Events <| record.events)
        , ("favorites",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        , ("preferences",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3Preferences <| record.preferences)
        ]

encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 -> Json.Encode.Value
encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events -> Json.Encode.Value
encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events record =
    Json.Encode.object
        [ ("3921995",  encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events3921995 <| record.3921995)
        ]

encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites -> Json.Encode.Value
encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 : FireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 -> Json.Encode.Value
encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("events",  encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Events <| record.events)
        , ("favorites",  encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites : FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites -> Json.Encode.Value
encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 : FireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 -> Json.Encode.Value
encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("email",  Json.Encode.string <| record.email)
        , ("favorites",  encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom record =
    Json.Encode.object
        [ ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  Json.Encode.string <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 record =
    Json.Encode.object
        [ ("chatsFrom",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294ChatsFrom <| record.chatsFrom)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent record =
    Json.Encode.object
        [ ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  Json.Encode.string <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 record =
    Json.Encode.object
        [ ("chatsSent",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514ChatsSent <| record.chatsSent)
        , ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 record =
    Json.Encode.object
        [ ("eventId",  Json.Encode.int <| record.eventId)
        , ("eventSource",  Json.Encode.int <| record.eventSource)
        , ("eventTitle",  Json.Encode.string <| record.eventTitle)
        , ("isGoing",  Json.Encode.bool <| record.isGoing)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events record =
    Json.Encode.object
        [ ("3521816",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3521816 <| record.3521816)
        , ("3658263",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3658263 <| record.3658263)
        , ("3831916",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events3831916 <| record.3831916)
        , ("4019294",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4019294 <| record.4019294)
        , ("4021514",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4021514 <| record.4021514)
        , ("4064231",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4064231 <| record.4064231)
        , ("4070378",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events4070378 <| record.4070378)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites record =
    Json.Encode.object
        [ ("null",  Json.Encode.bool <| record.null)
        ]

encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 : FireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 -> Json.Encode.Value
encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 record =
    Json.Encode.object
        [ ("age",  Json.Encode.int <| record.age)
        , ("events",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Events <| record.events)
        , ("favorites",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2Favorites <| record.favorites)
        , ("firstName",  Json.Encode.string <| record.firstName)
        , ("gender",  Json.Encode.int <| record.gender)
        , ("id",  Json.Encode.string <| record.id)
        , ("imageUrl",  Json.Encode.string <| record.imageUrl)
        , ("lastName",  Json.Encode.string <| record.lastName)
        ]

encodeFireBaseUsers : FireBaseUsers -> Json.Encode.Value
encodeFireBaseUsers record =
    Json.Encode.object
        [ ("eRadmcUfTJa6r5lEKnhfkbNKqH22",  encodeFireBaseUsersERadmcUfTJa6r5lEKnhfkbNKqH22 <| record.eRadmcUfTJa6r5lEKnhfkbNKqH22)
        , ("gb4K6NVmK8R2BvqUCCXuy4gpYnw2",  encodeFireBaseUsersGb4K6NVmK8R2BvqUCCXuy4gpYnw2 <| record.gb4K6NVmK8R2BvqUCCXuy4gpYnw2)
        , ("hliOU22tQTXivqLHjjxuIfjIgjI3",  encodeFireBaseUsersHliOU22tQTXivqLHjjxuIfjIgjI3 <| record.hliOU22tQTXivqLHjjxuIfjIgjI3)
        , ("nTlc5urLzWcKVcczE5KnAHgJ5GC2",  encodeFireBaseUsersNTlc5urLzWcKVcczE5KnAHgJ5GC2 <| record.nTlc5urLzWcKVcczE5KnAHgJ5GC2)
        , ("nzYrYPYzAAan1S3Gcxb0ac0P4873",  encodeFireBaseUsersNzYrYPYzAAan1S3Gcxb0ac0P4873 <| record.nzYrYPYzAAan1S3Gcxb0ac0P4873)
        , ("vG1yMgPN3afpyqxSUBcXxAixTaW2",  encodeFireBaseUsersVG1yMgPN3afpyqxSUBcXxAixTaW2 <| record.vG1yMgPN3afpyqxSUBcXxAixTaW2)
        , ("xKUVYxQS0mbfNEsN4q4FseuQ4nf2",  encodeFireBaseUsersXKUVYxQS0mbfNEsN4q4FseuQ4nf2 <| record.xKUVYxQS0mbfNEsN4q4FseuQ4nf2)
        , ("y89tpPBrt1WTImzTsCMjAuhL4IA3",  encodeFireBaseUsersY89tpPBrt1WTImzTsCMjAuhL4IA3 <| record.y89tpPBrt1WTImzTsCMjAuhL4IA3)
        , ("b6j5J35XorPWcG9x2501wlMYk6y1",  encodeFireBaseUsersB6j5J35XorPWcG9x2501wlMYk6y1 <| record.b6j5J35XorPWcG9x2501wlMYk6y1)
        , ("ewkd6ryL5GYY8XbgL7FQTnsmTkY2",  encodeFireBaseUsersEwkd6ryL5GYY8XbgL7FQTnsmTkY2 <| record.ewkd6ryL5GYY8XbgL7FQTnsmTkY2)
        , ("ogeM0vZAgETqD7tgDMkQnZGsRjP2",  encodeFireBaseUsersOgeM0vZAgETqD7tgDMkQnZGsRjP2 <| record.ogeM0vZAgETqD7tgDMkQnZGsRjP2)
        ]