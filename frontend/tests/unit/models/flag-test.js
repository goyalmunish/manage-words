import { moduleForModel, test } from 'ember-qunit';

moduleForModel('flag', 'Unit | Model | flag', {
  // Specify the other units that are required for this test.
  needs: ['model:word']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});
