<template>
    <div>
      <div>
        <input v-model="newTask" placeholder="Add a new task" />
        <button @click="addNewTask">Add</button>
      </div>
      <ul>
        <task v-for="(task, index) in tasks" :key="index" :task="task" :index="index" @deleteTask="deleteTask" @editTask="editTask" />
      </ul>
    </div>
  </template>
  
  <script>
  import Task from './Task.vue';
  
  export default {
    name: 'TaskList',
    components: {
      Task,
    },
    props: {
      tasks: Array,
    },
    data() {
      return {
        newTask: '',
      };
    },
    methods: {
      addNewTask() {
        if (this.newTask.trim() !== '') {
          this.$emit('addTask', this.newTask.trim());
          this.newTask = '';
        }
      },
      deleteTask(index) {
        this.$emit('deleteTask', index);
      },
      editTask(index, updatedTask) {
        this.$emit('editTask', index, updatedTask);
      },
    },
  };
  </script>
  
  <style scoped>
  ul {
    list-style-type: none;
    padding: 0;
  }
  
  input {
    padding: 5px;
    margin-bottom: 10px;
  }
  
  button {
    margin-left: 5px;
    cursor: pointer;
  }
  </style>
  