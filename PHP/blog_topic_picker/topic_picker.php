<?php

# I have a list of things I want to blog about that is always growing.
# The problem is that by the time I'm ready to write a blog post, I can't decide
# which topic to write about so I don't write at all.

# I'm puttng this file on my webserver and visiting it every week.
# Whatever topic pops up is the one I write about that week.

# Only allow my IP address
// if (getenv('MY_PUBLIC_IP') != $_SERVER['REMOTE_ADDR']) {
// 	exit('Access denied');
// }

define('TOPICS_FILE', 'topics.txt');

if (isset($_GET['new_topic']) && false === empty($_GET['new_topic'])) {
	$topic = xss_clean($_GET['new_topic']);
	create_new_topic($topic);
}

if (isset($_GET['delete_topic'])) {
	delete_topic($_GET['delete_topic']);
}


/**
 * Removes everything but letters numbers and spaces
 *
 * @param string the string to clean
 *
 * @return string the cleaned string
 */
function xss_clean($string)
{
	return preg_replace("/[^ \w]+/", "", $string);
}


/**
 * Returns the current topics
 *
 * @param string $format the format to return array or string
 *
 * @return mixed current topics
 */
function get_current_topics($format = 'string')
{
	if ('array' == $format) {
		return file(TOPICS_FILE);
	}
	
	return file_get_contents(TOPICS_FILE);
}


/**
 * Creates a new topic
 *
 * @param string $topic the new topic title
 */
function create_new_topic($topic)
{
	$topics = get_current_topics() . "\n$topic";

	if (false === topic_exists($topic)) {
		file_put_contents(TOPICS_FILE, $topics);
	}
}


/**
 * Deletes a topic
 *
 * @param string $topic_to_remove
 *
 * @return void
 */
function delete_topic($topic_to_remove)
{
	$topics = get_current_topics();
	$topics = str_replace($topic_to_remove, '', $topics);
	file_put_contents(TOPICS_FILE, $topics);
}


/**
 * Returns true if topic already exists
 *
 * @param string $new_topic the topic to check for
 *
 * @return bool true if topic exists
 */
function topic_exists($new_topic)
{
	$current_topics = array_map('strtolower', file(TOPICS_FILE));
	return in_array(strtolower($new_topic), $current_topics);
}


/**
 * Returns a random topic
 *
 * @return string random topic
 */
function get_random_topic()
{
	$topics = get_current_topics('array');
	$key = array_rand($topics);
	return $topics[$key];
}


echo 'Random Topic: <strong>' . get_random_topic() . '</strong>';
echo '<br />';
echo '<br />';
echo '<pre>';
print_r(get_current_topics('array'));
echo '</pre>';
echo '<br />';
echo '?new_topic=topic name';
echo '<br />';
echo '?delete_topic=topic name';