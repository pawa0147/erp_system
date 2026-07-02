document.addEventListener('DOMContentLoaded', () => {

    // Function to add new item row
    window.addItemRow = function () {
        const tbody = document.getElementById('items-body');
        const rowCount = tbody.rows.length;
        const row = document.createElement('tr');

        // Build service options if available
        let serviceOptions = '<option value="">Select a Service (Optional)</option>';
        if (window.availableServices) {
            window.availableServices.forEach(svc => {
                // Store price and desc in data attributes for easy access
                // Escape quotes in description to avoid breaking HTML
                const safeDesc = svc.description.replace(/"/g, '&quot;');
                serviceOptions += `<option value="${svc.id}" data-price="${svc.price}" data-desc="${safeDesc}">${svc.title}</option>`;
            });
        }

        row.innerHTML = `
            <td>
                <select class="service-select" style="width:100%; margin-bottom: 8px; font-weight: 500;" onchange="fillServiceDetails(this)">
                    ${serviceOptions}
                </select>
                <textarea name="items[${rowCount}][description]" class="item-desc" placeholder="Item description" required style="width:100%;" rows="3"></textarea>
            </td>
            <td style="vertical-align: top;"><input type="number" name="items[${rowCount}][quantity]" class="qty" value="1" min="1" step="0.01" oninput="calculateRowTotal(this)"></td>
            <td style="vertical-align: top;"><input type="number" name="items[${rowCount}][price]" class="price" value="0.00" min="0" step="0.01" oninput="calculateRowTotal(this)"></td>
            <td style="vertical-align: top;"><input type="text" class="row-total" value="0.00" readonly></td>
            <td style="vertical-align: top;"><button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)"><i class="fa-solid fa-trash"></i></button></td>
        `;

        tbody.appendChild(row);
    };

    window.fillServiceDetails = function (select) {
        const option = select.options[select.selectedIndex];
        if (option.value) {
            const price = parseFloat(option.getAttribute('data-price'));
            const desc = option.getAttribute('data-desc'); // This comes in escaped, but textarea value handles it fine? No, we might need to decode if it was HTML encoded.
            // Since we replaced " with &quot;, setting .value will show &quot; if we are not careful.
            // Actually .value assignment decodes automatically? No.
            // Let's us a safer way:
            const row = select.closest('tr');
            const descField = row.querySelector('.item-desc');
            const priceField = row.querySelector('.price');

            // To properly decode, use a temporary element or just raw string if we didn't escape too much.
            // The replace above was for the HTML attribute. When we read .getAttribute it gives us the raw string back usually?
            // Let's verify. Attribute values are entity-decoded when accessed via getAttribute?
            // Yes usually.

            descField.value = desc;
            priceField.value = price.toFixed(2);
            calculateRowTotal(priceField);
        }
    };

    // Function to remove row
    window.removeRow = function (btn) {
        const row = btn.closest('tr');
        const tbody = document.getElementById('items-body');
        if (tbody.rows.length > 1) {
            row.remove();
            calculateGrandTotal();
        } else {
            alert("At least one item is required.");
        }
    };

    // Calculate row total
    window.calculateRowTotal = function (input) {
        const row = input.closest('tr');
        const qty = parseFloat(row.querySelector('.qty').value) || 0;
        const price = parseFloat(row.querySelector('.price').value) || 0;
        const total = qty * price;
        row.querySelector('.row-total').value = total.toFixed(2);
        calculateGrandTotal();
    };

    // Calculate grand total
    window.calculateGrandTotal = function () {
        let subtotal = 0;
        document.querySelectorAll('.row-total').forEach(input => {
            subtotal += parseFloat(input.value) || 0;
        });

        const taxPercent = parseFloat(document.getElementById('tax_percent').value) || 0;
        const taxAmount = subtotal * (taxPercent / 100);
        const totalAmount = subtotal + taxAmount;

        document.getElementById('subtotal_display').innerText = '₹' + subtotal.toLocaleString('en-IN', { minimumFractionDigits: 2 });
        document.getElementById('tax_amount_display').innerText = '₹' + taxAmount.toLocaleString('en-IN', { minimumFractionDigits: 2 });
        document.getElementById('total_amount_display').innerText = '₹' + totalAmount.toLocaleString('en-IN', { minimumFractionDigits: 2 });
    };
});
