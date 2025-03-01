import { verify } from "jsonwebtoken";

export default function roleHandler(req, res){
  try{
    const {loginToken} = req.cookies
    const user = verify(loginToken, 'secret')
    return res.json({username: user.username, role: user.role})
  }catch (error) {
    return res.status(401).json({error: "invalid token"});
  }
  
}