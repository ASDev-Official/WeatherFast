import re

with open("android/app/src/main/res/layout/weather_widget_host.xml", "r") as f:
    content = f.read()

# Extract widget_section_hourly_sg
sg_start_marker = '    <LinearLayout\n        android:id="@+id/widget_section_hourly_sg"'
daily_marker = '    <LinearLayout\n        android:id="@+id/widget_section_daily"'

sg_start_idx = content.find(sg_start_marker)
daily_idx = content.find(daily_marker)

sg_block = content[sg_start_idx:daily_idx]

# Remove sg_block from content
content = content[:sg_start_idx] + content[daily_idx:]

# Extract widget_section_hourly
hourly_start_marker = '    <LinearLayout\n        android:id="@+id/widget_section_hourly"'
hourly_start_idx = content.find(hourly_start_marker)

# We need to insert wrapper before hourly_start_marker
wrapper_and_sg = """    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal">

        <LinearLayout
            android:id="@+id/widget_header_sg_left"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="0.4"
            android:orientation="vertical"
            android:paddingEnd="12dp"
            android:visibility="gone">

            <TextView
                android:id="@+id/widget_location_sg"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:ellipsize="end"
                android:maxLines="2"
                android:text="WeatherFast"
                android:textColor="#F4FAFF"
                android:textSize="16sp"
                android:textStyle="bold" />

            <TextView
                android:id="@+id/widget_condition_sg"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="2dp"
                android:ellipsize="end"
                android:maxLines="2"
                android:text="--"
                android:textColor="#CADAEA"
                android:textSize="12sp" />

            <TextView
                android:id="@+id/widget_temp_sg"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:layout_marginTop="8dp"
                android:text="--"
                android:textColor="#F4FAFF"
                android:textSize="32sp"
                android:textStyle="bold" />

            <TextView
                android:id="@+id/widget_high_low_sg"
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:text="-- / --"
                android:textColor="#CADAEA"
                android:textSize="11sp" />
        </LinearLayout>

        <LinearLayout
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="0.6"
            android:orientation="vertical">

"""

# Now we need to append sg_block and the original hourly_block, then close the two wrapper layouts.
# We'll just insert `wrapper_and_sg` + `sg_block` + `<LinearLayout id="widget_section_hourly"...`
# Wait, we need to close the two wrappers after `widget_section_hourly`.
# Where does `widget_section_hourly` end?
# It ends right before where sg_block used to be, which is now `daily_idx` (adjusted).

# So, content from hourly_start_idx to where sg_block used to start is the hourly_block.
hourly_block = content[hourly_start_idx:sg_start_idx]

# Remove hourly_block from content
content = content[:hourly_start_idx] + content[sg_start_idx:]

closing_tags = "        </LinearLayout>\n    </LinearLayout>\n\n"

# Reassemble
final_content = content[:hourly_start_idx] + wrapper_and_sg + sg_block + hourly_block + closing_tags + content[hourly_start_idx:]

with open("android/app/src/main/res/layout/weather_widget_host.xml", "w") as f:
    f.write(final_content)

print("Done")
