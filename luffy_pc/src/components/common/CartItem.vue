<template>
    <div class="cart_item">
      <div class="cart_column column_1">
        <el-checkbox class="my_el_checkbox" v-model="cart.is_selected"></el-checkbox>
      </div>
      <div class="cart_column column_2">
        <img :src="cart.course_img" alt="">
        <span><router-link :to="`/course/detail/${cart.id}`">{{cart.name}}</router-link></span>
      </div>
      <div class="cart_column column_3">
        <el-select v-model="expire" size="mini" placeholder="请选择购买有效期" class="my_el_select">
          <el-option v-for="item in cart.expire_list" :label="item.expire_text" :value="item.expire_time" :key="item.expire_time"></el-option>
        </el-select>
      </div>
      <div class="cart_column column_4">¥{{cart.price.toFixed(2)}}</div>
      <div class="cart_column column_4">删除</div>
    </div>
</template>

<script>
export default {
    name: "CartItem",
    props: ['cart'],
    data(){
      return {
        checked:false,
        expire: "永久有效",
      }
    },
    watch:{
        'cart.is_selected': function(value){
            this.selectedChange()
        },
        'expire': function(value){
            console.log(value);
            this.cart.expire_list.forEach((item, key)=>{
                if (item.expire_time == value){
                    this.cart.price = item.price;
                }
            })
        }
    },
    methods:{
        selectedChange(){
            let course_id = this.cart.id;
            let is_selected = this.cart.is_selected;
            this.$axios.patch(`${this.$settings.Host}/cart/course/patch/`, {
                course_id,  // course_id: course_id
                is_selected: Boolean(is_selected),
            }).then(response=>{
                this.$message('切换勾选状态成功！')
            }).catch(error=>{
                console.log(error.response)
            })
        }
    },
}
</script>

<style scoped>
.cart_item::after{
  content: "";
  display: block;
  clear: both;
}
.cart_column{
  float: left;
  height: 250px;
}
.cart_item .column_1{
  width: 88px;
  position: relative;
}
.my_el_checkbox{
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  top: 0;
  margin: auto;
  width: 16px;
  height: 16px;
}
.cart_item .column_2 {
  padding: 67px 10px;
  width: 520px;
  height: 116px;
}
.cart_item .column_2 img{
  width: 175px;
  height: 115px;
  margin-right: 35px;
  vertical-align: middle;
}
.cart_item .column_3{
  width: 197px;
  position: relative;
  padding-left: 10px;
}
.my_el_select{
  width: 117px;
  height: 28px;
  position: absolute;
  top: 0;
  bottom: 0;
  margin: auto;
}
.cart_item .column_4{
  padding: 67px 10px;
  height: 116px;
  width: 142px;
  line-height: 116px;
}

</style>
