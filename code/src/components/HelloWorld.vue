<template>
  <li>
    <span v-if="!editing">{{ task }}</span>
    <input v-model="updatedTask" v-if="editing" placeholder="Edit task" />
    <button v-if="!editing" @click="toggleEdit">Edit</button>
    <button v-if="!editing" @click="deleteTask">Delete</button>
    <button v-if="editing" @click="saveTask">Save</button>
  </li>
</template>

<script>
export default {
  name: 'TaskItem',
  props: {
    task: String,
    index: Number,
  },
  data() {
    return {
      editing: false,
      updatedTask: this.task,
    };
  },
  methods: {
    toggleEdit() {
      this.editing = !this.editing;
    },
    saveTask() {
      if (this.updatedTask.trim() !== '') {
        this.$emit('editTask', this.index, this.updatedTask.trim());
        this.editing = false; // Set editing to false after saving
      }
    },
    deleteTask() {
      this.$emit('deleteTask', this.index);
    },
  },
};
</script>

<style scoped>
li {
  margin-bottom: 5px;
  position: relative;
}

button {
  margin-left: 5px;
  cursor: pointer;
}
</style>
