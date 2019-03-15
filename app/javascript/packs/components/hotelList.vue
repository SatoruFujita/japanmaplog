<script>
export default {
  name: 'hotel-list',
  props: ['vacant-hotel-data'],
};
</script>
<template>
  <div>
    <ul id="test" class="list">
      <li class="item" v-for="item of vacantHotelData" >

      </li>
    </ul>
  </div>
</template>
