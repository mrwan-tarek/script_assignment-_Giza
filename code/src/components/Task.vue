<template>
  <li @click="handleClick" :class="{ 'completed-task': completed }">
    <span v-if="!editing">{{ task }}</span>
    <input v-model="updatedTask" v-if="editing" placeholder="Edit task" />
    <img v-if="!editing" src="@/assets/edit.png" alt="Edit" class="icon" @click="toggleEdit" />
    <img v-if="!editing" src="@/assets/delete.png" alt="Delete" class="icon" @click="deleteTask" />
    <img v-if="!editing" src="@/assets/toggle.png" alt="Toggle" class="icon" />
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
      completed: false,
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
    handleClick() {
      if (!this.editing) {
        this.completed = !this.completed;
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
  cursor: pointer;
}

.icon {
  width: 20px;
  height: 20px;
  cursor: pointer;
  margin-left: 5px;
}

.completed-task {
  text-decoration: line-through;
}
</style>
