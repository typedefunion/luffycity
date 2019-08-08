

def jwt_response_payload_handler(token, user=None, request=None):
    # 自定义登入以后返回的数据
    return {
        'token': token,
        'user_id': user.id,
        'user_name': user.username
    }