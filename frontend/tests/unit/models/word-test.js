import { moduleForModel, test } from 'ember-qunit';

moduleForModel('word', 'Unit | Model | word', {
  // Specify the other units that are required for this test.
  needs: ['model:user', 'model:flag']
});

test('it exists', function(assert) {
  let model = this.subject();
  // let store = this.store();
  assert.ok(!!model);
});
