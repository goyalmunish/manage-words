import Ember from 'ember';

export default Ember.Component.extend({
  // Properties used as arguments: words, word_search, full_search

  // Other properties
  suggestions: null,
  sort_by_possibilities: ['id', 'word', 'trick'],
  sort_by: null,

  // Computed propreties
  filteredWords: Ember.computed('word_search', 'full_search', 'sort_by', function() {
    console.log("-----FILTERING-----");
    let filtered_words = this.get('words');
    let word_search = this.get('word_search');
    let full_search = this.get('full_search');
    let sort_by = this.get('sort_by');

    // word search
    if(word_search) {
      console.log("Word search for: " + word_search);
      try {
        let re_word_search = new RegExp(word_search);

        // filtered_words = words.filterBy('word', word_search);
        filtered_words = filtered_words.filter(function(item) {
          let result = re_word_search.test(item.get('word'));  // Note: Here we used item.get('word') and not item.word. The later one would work only in templates.
          return result;
        });
      } catch(e) {
        console.log(`Supressing error: ${e}`);
      }
    } else {
      console.log("Word search for: <blank_value>");
    }

    // full search
    if(full_search) {
      console.log("Full search for: " + full_search);
      try {
        let re_full_search = new RegExp(full_search);

        filtered_words = filtered_words.filter(function(item) {
          let result = re_full_search.test(item.get('word')) || re_full_search.test(item.get('trick')) || re_full_search.test(item.get('additionalInfo'));
          return result;
        });
      } catch(e) {
        console.log(`Supressing error: ${e}`);
      }
    } else {
      console.log("Full search for: <blank_value>");
    }

    // sorting
    if(sort_by && this.get('sort_by_possibilities').contains(sort_by)){
      console.log("SortBy: " + sort_by);
      filtered_words = filtered_words.sortBy(sort_by);
    } else {
      console.log("Tried to sort_by " + sort_by);
    }

    return filtered_words;
  }),

  numberOfFilteredWords: Ember.computed('filteredWords', function() {
    // Note that calling just `length` works in view but not here
    return this.get('filteredWords').get('length');
  }),

  // Actions
  actions: {
    setSortBy(sort_by) {
      this.set('sort_by', sort_by);
    },
    // this functionality is implemented using actions for learning purpose, though
    // it could be easily done using computed property based on filteredWords
    calculateSuggestions() {
      if (this.get('word_search') || this.get('full_search')) {
        let suggestions = this.get('filteredWords').map(function(item) {
          return item.get('word');
        });
        this.set('suggestions', suggestions.slice(0,9));
      } else {
        if (this.get('suggestion')) {
          this.get('suggestions').clear();
        }
      }
    }
  }
});
